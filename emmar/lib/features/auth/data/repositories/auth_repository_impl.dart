import 'package:dartz/dartz.dart';
import 'package:emmar/core/errors/failure.dart';
import 'package:emmar/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:emmar/features/auth/data/models/registration_model.dart';
import 'package:emmar/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Unit>> sendOtp(String phoneNumber) async {
    await remoteDataSource.sendOtp(phoneNumber);
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> verifyOtp(
    String phoneNumber,
    String code,
  ) async {
    await remoteDataSource.verifyOtp(phoneNumber, code);
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> register(data) async {
    await remoteDataSource.register(RegistrationModel.fromEntity(data));
    throw UnimplementedError();
  }
}
