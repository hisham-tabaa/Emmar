import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? token;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.token,
  });

  @override
  List<Object?> get props => [userId, firstName, lastName, email, phone, token];
}
