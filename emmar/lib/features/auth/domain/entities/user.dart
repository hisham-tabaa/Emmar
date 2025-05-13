import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [userId, userId, lastName, email, phone];
}
