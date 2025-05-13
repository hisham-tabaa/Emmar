// bloc/registration/registration_event.dart
abstract class RegistrationEvent {}

class SubmitPersonalInfo extends RegistrationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  SubmitPersonalInfo(this.firstName, this.lastName, this.email, this.phoneNumber);
}

class SubmitOtp extends RegistrationEvent {
  final String code;
  SubmitOtp(this.code);
}

class SubmitPassword extends RegistrationEvent {
  final String password;
  SubmitPassword(this.password);
}

// Add more events for other fields (latitude, etc.)