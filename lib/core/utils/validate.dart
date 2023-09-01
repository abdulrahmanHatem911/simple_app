class Validate {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    if (value.contains('@') == false) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!RegExp(r'^[A-Z]').hasMatch(value)) {
      return 'Password must start with a capital letter';
    }
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain symbols/punctuation';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 3) {
      return 'Full name must be at least 3 characters long';
    }
    if (value.contains(RegExp(r'^[0-9]+$'))) {
      return 'Full name must contain both letters and numbers';
    }

    return null;
  }

  static String? phone(String? value) {
    if (value!.isEmpty) {
      return 'enter phone number';
    }
    if (value.length < 11) {
      return 'enter a valid phone';
    }
    return null;
  }

  static String? position(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your position';
    }
    return null;
  }

  static String? governorate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your governorate';
    }
    return null;
  }

  static String? age(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your age';
    }
    return null;
  }

  static String? weight(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your weight';
    }
    return null;
  }

  static String? height(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your height';
    }
    return null;
  }

  static String? text(String? value) {
    if (value!.isEmpty) {
      return 'field is required';
    }
    return null;
  }
}
