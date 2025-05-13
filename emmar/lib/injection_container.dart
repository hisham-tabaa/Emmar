import 'package:dio/dio.dart';
import 'package:emmar/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:emmar/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:emmar/features/auth/domain/entities/registration_entity.dart';
import 'package:emmar/features/auth/domain/usecases/send_otp.dart';
import 'package:emmar/features/auth/presentation/bloc/registration_bloc_bloc.dart';

final dio = Dio(BaseOptions(baseUrl: 'https://192.168.101.81:443'));

// Initialize dependencies
final authRemoteDataSource = AuthRemoteDataSource(dio);
final authRepo = AuthRepositoryImpl(authRemoteDataSource);

final sendOtpUseCase = SendOtpUseCase(authRepo);
final verifyOtpUseCase = VerifyOtpUseCase(authRepo);
final registerUseCase = RegisterUseCase(authRepo);

// Create initial empty registration data
final initialRegistrationData = RegistrationEntity(
  firstName: '',
  lastName: '',
  email: '',
  phoneNumber: '',
  securityCode: '',
  password: '',
  latitude: '',
  longitude: '',
  profilePhoto: '',
  roleId: '',
);

// Initialize BLoC with proper initial data
final registrationBloc = RegistrationBloc(
  sendOtp: sendOtpUseCase,
  verifyOtp: verifyOtpUseCase,
  register: registerUseCase,
  registrationData: initialRegistrationData,
);