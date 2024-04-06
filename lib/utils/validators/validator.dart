class EValidator {
  // email validator
  static String? validateEmail(String? value) {
    if (value == null || value.isNotEmpty) {
      return 'Email is required';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  // password validator
  static String? validatePassword(String? value) {
    if (value == null || value.isNotEmpty) {
      return 'Password is required';
    }

    // check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 character long';
    }

    // check for upper case letter
    if (value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one upper case letter';
    }

    // check for upper case letter
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // check for special character
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one spacial character';
    }
    return null;
  }

  // validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isNotEmpty) {
      return 'Password is required';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format ( 10 digit required )';
    }

    return null;
  }
}
