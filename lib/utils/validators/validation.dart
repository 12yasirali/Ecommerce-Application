class YValidators {
  static String? validateEmptyText(String? firstName, String? value) {
    if (value == null || value.isEmpty) {
      return "$firstName is required";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    final emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegExp.hasMatch(email)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 6) {
      return "Password must be 6 characters long";
    }
    return null;
  }

  static String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone Number is required";
    }
    final phoneExp = RegExp(r"^\d(10)$");

    if (phoneExp.hasMatch(phone)) {
      return "Invalid phone number format (10 digits required)";
    }
    return null;
  }
}
