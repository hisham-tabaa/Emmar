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
  Future<Either<Failure, User>> login(
    String phoneNumber,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.login(phoneNumber, password);
        localDataSource.cacheUser(remoteUser);
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
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.createAccount(
          name,
          email,
          phoneNumber,
          password,
        );
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
  Future<Either<Failure, bool>> forgotPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.forgotPassword(email);
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
}
