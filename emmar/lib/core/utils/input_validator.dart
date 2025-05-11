class InputValidator {
  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  static bool isValidOTP(String otp) {
    return otp.length == 4 && int.tryParse(otp) != null;
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,12}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  static bool isValidName(String name) {
    return name.isNotEmpty && name.length >= 3;
  }
}