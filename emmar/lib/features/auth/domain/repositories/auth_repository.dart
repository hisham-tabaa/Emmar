
import 'package:dartz/dartz.dart';
import 'package:emmar/core/errors/failure.dart';
import 'package:emmar/features/auth/domain/entities/registration_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> sendOtp(String phoneNumber);
  Future<Either<Failure, Unit>> verifyOtp(String phoneNumber, String code);
  Future<Either<Failure, Unit >> register(RegistrationEntity data);
}