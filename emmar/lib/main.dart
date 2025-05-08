import 'package:emmar/features/auth/presentation/pages/first_screen.dart';
import 'package:emmar/features/auth/presentation/pages/login_page.dart';
import 'package:emmar/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
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
