class RegistrationEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? securityCode;
  final String? password;
  final String? latitude;
  final String? longitude;
  final String? profilePhoto;
  final String? roleId;

  const RegistrationEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.securityCode,
    this.password,
    this.latitude,
    this.longitude,
    this.profilePhoto,
    this.roleId,
  });

  factory RegistrationEntity.empty() => RegistrationEntity(
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
      );

  RegistrationEntity copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? securityCode,
    String? password,
    String? latitude,
    String? longitude,
    String? profilePhoto,
    String? roleId,
  }) {
    return RegistrationEntity(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      securityCode: securityCode ?? this.securityCode,
      password: password ?? this.password,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      roleId: roleId ?? this.roleId,
    );
  }
}