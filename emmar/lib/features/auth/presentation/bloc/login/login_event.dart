// lib/features/login/presentation/bloc/login_event.dart
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}
