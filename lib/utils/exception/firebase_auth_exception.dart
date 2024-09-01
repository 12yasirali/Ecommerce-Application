class YFirebaseAuthException implements Exception {
  final String code;

  YFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case "email-already-in-use":
        return "The email  address is already registered. Please use different email";
      case "Invalid-email":
        return "The email address provided is invalid. please enter a valid email";
      case "weak-password":
        return "The password is too weak. Please choose a stronger password";
      case "user-disabled":
        return "The user account has been disabled. please contact support for assistance";
      case "user-not-found":
        return "Invalid login details. User not found.";
      case "wrong-password":
        return "Incorrect password. Please check your password and try again";
      case "invalid-verification-code":
        return "Invalid verification code. please enter a valid code.";
      case "quota-exceeded":
        return "Quota exceeded.please try again later.";
      case "email-already-exists":
        return "The email  address already exists. please use a different email.";
      case "provider-already-linked":
        return "The account already linked with another provider.";
      default:
        return "User will not be created. Issues occurred";
    }
  }
}
