// use_cases/send_otp.dart
import 'package:dartz/dartz.dart';
import 'package:emmar/core/errors/failure.dart';
import 'package:emmar/features/auth/domain/entities/registration_entity.dart';
import 'package:emmar/features/auth/domain/repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;
  SendOtpUseCase(this.repository);

  Future<Future<Either<Failure, Unit>>> call(String phoneNumber) async {
    return repository.sendOtp(phoneNumber);
  }
}

// use_cases/verify_otp.dart
class VerifyOtpUseCase {
  final AuthRepository repository;
  VerifyOtpUseCase(this.repository);

  Future<Future<Either<Failure, Unit>>> call(String phoneNumber, String code) async {
    return repository.verifyOtp(phoneNumber, code);
  }
}

// use_cases/register.dart
class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<Future<Either<Failure, Unit>>> call(RegistrationEntity data) async {
    return repository.register(data);
  }
}