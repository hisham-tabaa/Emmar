import 'package:emmar/features/auth/domain/entities/registration_entity.dart';
import 'package:emmar/features/auth/domain/usecases/send_otp.dart';
import 'package:emmar/features/auth/presentation/bloc/registration_bloc_bloc.dart';
import 'package:emmar/features/auth/presentation/pages/first_screen.dart';
import 'package:emmar/features/auth/presentation/pages/login_page.dart';
import 'package:emmar/features/auth/presentation/pages/register_page.dart';
import 'package:emmar/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationBloc(
            sendOtp: SendOtpUseCase(authRepo),
            verifyOtp: VerifyOtpUseCase(authRepo),
            register: RegisterUseCase(authRepo),
            registrationData: RegistrationEntity.empty(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  FirstScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
