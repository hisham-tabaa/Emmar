import '../../domain/entities/user.dart';

class UserModel extends User {
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  UserModel({
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  }) : super(
         userId: userId,
         firstName: firstName,
         lastName: lastName,
         email: email,
         phone: phone,
         token: accessToken,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UserModel(
      userId: data['userId'],
      firstName: data['firstName'],
      lastName: data['lastName'] ?? '',
      email: data['email'],
      phone: data['phone'],
      accessToken: data['accessToken'],
      tokenType: data['tokenType'],
      expiresIn: int.tryParse(data['expiresIn']) ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "data": {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "accessToken": accessToken,
        "tokenType": tokenType,
        "expiresIn": expiresIn.toString(),
      },
      "message": "SUCCESS",
      "code": 200
    };
  }

}
