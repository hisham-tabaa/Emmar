import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:emmar/core/errors/failure.dart';
import 'package:emmar/features/auth/data/models/registration_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<Either<Failure, Unit>> sendOtp(String phoneNumber) async {
    try {
      await dio.post('/mobile/send-otp', data: {'phoneNumber': phoneNumber});
      return const Right(unit); 
    } on DioException catch (e) {
      return Left(ServerFailure(
        message: e.response?.data['message'] ?? 'Failed to send OTP',
        code: e.response?.statusCode.toString() ?? 'otp_failed',
      ));
    } catch (e) {
      return Left(ServerFailure(
        message: 'Unknown error occurred',
        code: 'unknown_error',
      ));
    }
  }

  Future<Either<Failure, Unit>> verifyOtp(String phoneNumber, String code) async {
    try {
      await dio.post('/mobile/verify-otp', data: {
        'phoneNumber': phoneNumber,
        'code': code,
      });
      return const Right(unit); // Explicit success return
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return Left(InvalidOtpFailure());
      }
      return Left(ServerFailure(
        message: e.response?.data['message'] ?? 'OTP verification failed',
        code: e.response?.statusCode.toString() ?? 'verify_failed',
      ));
    } catch (e) {
      return Left(ServerFailure(
        message: 'Unknown error occurred',
        code: 'unknown_error',
      ));
    }
  }

  Future<Either<Failure, Unit>> register(RegistrationModel data) async {
    try {
      await dio.post(
        '/api/mobile/register/',
        data: data.toJson(),
      );
      return const Right(unit); // Explicit success return
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return Left(PhoneNumberAlreadyInUseFailure());
      }
      return Left(ServerFailure(
        message: e.response?.data['message'] ?? 'Registration failed',
        code: e.response?.statusCode.toString() ?? 'registration_failed',
      ));
    } catch (e) {
      return Left(ServerFailure(
        message: 'Unknown error occurred',
        code: 'unknown_error',
      ));
    }
  }
}