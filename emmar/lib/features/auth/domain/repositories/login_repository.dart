// lib/features/login/domain/repositories/login_repository.dart
import 'package:dartz/dartz.dart';
import 'package:emmar/core/error/auth/login_error.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(String email, String password);
}
