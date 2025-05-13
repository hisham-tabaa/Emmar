import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {}

class OTPSent extends AuthState {
  final String email;

  OTPSent({required this.email});

  @override
  List<Object> get props => [email];
}

class OTPVerified extends AuthState {}

class AccountCreated extends AuthState {}

class PasswordResetEmailSent extends AuthState {}