import 'package:emmar/features/auth/presentation/pages/first_screen.dart';
import 'package:emmar/features/auth/presentation/pages/login_page.dart';
import 'package:emmar/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/login/login_bloc.dart';
import 'injection_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
        },
      ),
    );
  }
}