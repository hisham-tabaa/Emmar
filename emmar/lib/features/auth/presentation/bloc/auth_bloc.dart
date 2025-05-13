import 'package:flutter_bloc/flutter_bloc.dart';


import '../../domain/usecases/create_account.dart';
import '../../domain/usecases/forgot_password.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/verify_otp.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final CreateAccount createAccount;
  final VerifyOTP verifyOTP;
  final ForgotPassword forgotPassword;

  AuthBloc({
    required this.login,
    required this.createAccount,
    required this.verifyOTP,
    required this.forgotPassword,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<CreateAccountEvent>(_onCreateAccountEvent);
    on<VerifyOTPEvent>(_onVerifyOTPEvent);
    on<ForgotPasswordEvent>(_onForgotPasswordEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await login(
      LoginParams(email: event.phoneNumber, password: event.password),
    );

    result.fold(
          (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
          (user) => emit(Authenticated(user: user)),
    );
  }

  Future<void> _onCreateAccountEvent(
      CreateAccountEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await createAccount(
      CreateAccountParams(
        name: event.name,
        email: event.email,
        phoneNumber: event.phoneNumber,
        password: event.password,
      ),
    );

    result.fold(
          (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
          (success) => emit(OTPSent(email: event.email)),
    );
  }

  Future<void> _onVerifyOTPEvent(
      VerifyOTPEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await verifyOTP(
      VerifyOTPParams(email: event.email, otp: event.otp),
    );

    result.fold(
          (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
          (success) => emit(OTPVerified()),
    );
  }

  Future<void> _onForgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await forgotPassword(
      ForgotPasswordParams(email: event.email),
    );

    result.fold(
          (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
          (success) => emit(PasswordResetEmailSent()),
    );

  }

  String _mapFailureToMessage(failure) {
    // Handle different types of failures
    return failure.toString();
  }
}