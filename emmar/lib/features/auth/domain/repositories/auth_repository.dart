import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String phoneNumber, String password);
  Future<Either<Failure, bool>> verifyOTP(String email, String otp);
  Future<Either<Failure, bool>> createAccount(
    String name,
    String email,
    String phoneNumber,
    String password,
  );
  Future<Either<Failure, bool>> forgotPassword(String email);
}
