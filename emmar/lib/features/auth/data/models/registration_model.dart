
import 'package:emmar/features/auth/domain/entities/registration_entity.dart';

class RegistrationModel extends RegistrationEntity {
  RegistrationModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.securityCode,
    required super.password,
    required super.latitude,
    required super.longitude,
    required super.profilePhoto,
    required super.roleId,
  });

  factory RegistrationModel.fromEntity(RegistrationEntity entity) {
    return RegistrationModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      securityCode: entity.securityCode,
      password: entity.password,
      latitude: entity.latitude,
      longitude: entity.longitude,
      profilePhoto: entity.profilePhoto,
      roleId: entity.roleId,
    );
  }

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "securityCode": securityCode,
    "password": password,
    "latitude": latitude,
    "longitude": longitude,
    "profilePhoto": profilePhoto,
    "roleId": roleId,
  };
}