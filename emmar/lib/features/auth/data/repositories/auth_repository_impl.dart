import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login(String phoneNumber, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.login(phoneNumber, password);
        await localDataSource.cacheUser(remoteUser);
        
        // Save the token from the user model (accessToken)
        await localDataSource.saveToken(remoteUser.accessToken);
        
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      } on ValidationException catch (e) {
        return Left(ValidationFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOTP(String email, String otp) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.verifyOTP(email, otp);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on ValidationException catch (e) {
        return Left(ValidationFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createAccount(
      String name, String email, String phoneNumber, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.createAccount(name, email, phoneNumber, password);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on ValidationException catch (e) {
        return Left(ValidationFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(String phoneNumber) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.forgotPassword(phoneNumber);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on ValidationException catch (e) {
        return Left(ValidationFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> checkAuthStatus() async {
    try {
      // Check if token exists
      final hasToken = await localDataSource.hasToken();
      if (!hasToken) {
        return Left(CacheFailure());
      }
      
      // Get cached user
      try {
        final user = await localDataSource.getLastUser();
        
        // Validate token with server if network is available
        if (await networkInfo.isConnected) {
          try {
            final token = await localDataSource.getToken();
            final validatedUser = await remoteDataSource.validateToken(token!);
            await localDataSource.cacheUser(validatedUser);
            return Right(validatedUser);
          } on ServerException {
            // Token invalid on server, but we still have cached user
            return Right(user);
          }
        }
        
        // Return cached user if no network
        return Right(user);
      } on CacheException {
        return Left(CacheFailure());
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}