import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  LoginEvent({required this.phoneNumber, required this.password});

  @override
  List<Object> get props => [phoneNumber, password];
}

class CreateAccountEvent extends AuthEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  CreateAccountEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, phoneNumber, password];
}

class VerifyOTPEvent extends AuthEvent {
  final String email;
  final String otp;

  VerifyOTPEvent({required this.email, required this.otp});

  @override
  List<Object> get props => [email, otp];
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  ForgotPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}