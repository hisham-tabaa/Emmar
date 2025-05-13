// bloc/registration/registration_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:emmar/features/auth/domain/entities/registration_entity.dart';
import 'package:emmar/features/auth/domain/usecases/send_otp.dart';

import 'package:emmar/features/auth/presentation/bloc/registration_bloc_event.dart';
import 'package:emmar/features/auth/presentation/bloc/registration_bloc_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final SendOtpUseCase sendOtp;
  final VerifyOtpUseCase verifyOtp;
  final RegisterUseCase register;

  RegistrationBloc({
    required this.sendOtp,
    required this.verifyOtp,
    required this.register, required RegistrationEntity registrationData,
  }) : super(RegistrationInitial()) {
    on<SubmitPersonalInfo>(_onSubmitPersonalInfo);
    on<SubmitOtp>(_onSubmitOtp);
    on<SubmitPassword>(_onSubmitPassword);
  }

  RegistrationEntity _registrationData = RegistrationEntity.empty();

  Future<void> _onSubmitPersonalInfo(
    SubmitPersonalInfo event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoading());
    try {
      // Update registration data
      _registrationData = _registrationData.copyWith(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phoneNumber: event.phoneNumber,
      );

      // Send OTP
      await sendOtp(event.phoneNumber);
      emit(OtpSent());
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }

  Future<void> _onSubmitOtp(
    SubmitOtp event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoading());
    try {
      // Verify OTP
      await verifyOtp(_registrationData.phoneNumber, event.code);
      emit(OtpVerified());
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }

  Future<void> _onSubmitPassword(
    SubmitPassword event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationLoading());
    try {
      // Complete registration
      final completedData = _registrationData.copyWith(
        password: event.password,
      );
      await register(completedData);
      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }
}