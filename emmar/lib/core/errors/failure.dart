import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String code;
  final StackTrace? stackTrace;

  const Failure({
    required this.message,
    required this.code,
    this.stackTrace,
  });

  @override
  List<Object?> get props => [message, code, stackTrace];

  @override
  String toString() => 'Failure(message: $message, code: $code, stackTrace: $stackTrace)';
}

// Common failures
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.code,
    super.stackTrace,
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    StackTrace? stackTrace,
  }) : super(
          message: 'No internet connection',
          code: 'network_failure',
          stackTrace: stackTrace,
        );
}

class CacheFailure extends Failure {
  const CacheFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          code: 'cache_failure',
          stackTrace: stackTrace,
        );
}

class InvalidOtpFailure extends Failure {
  const InvalidOtpFailure({
    StackTrace? stackTrace,
  }) : super(
          message: 'Invalid OTP code',
          code: 'invalid_otp',
          stackTrace: stackTrace,
        );
}

class RegistrationFailure extends Failure {
  const RegistrationFailure({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          code: 'registration_failed',
          stackTrace: stackTrace,
        );
}

class PhoneNumberAlreadyInUseFailure extends Failure {
  const PhoneNumberAlreadyInUseFailure({
    StackTrace? stackTrace,
  }) : super(
          message: 'Phone number already in use',
          code: 'phone_number_exists',
          stackTrace: stackTrace,
        );
}

// Validation failures
class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure({
    StackTrace? stackTrace,
  }) : super(
          message: 'Invalid email format',
          code: 'invalid_email',
          stackTrace: stackTrace,
        );
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure({
    StackTrace? stackTrace,
  }) : super(
          message: 'Password is too weak',
          code: 'weak_password',
          stackTrace: stackTrace,
        );
}