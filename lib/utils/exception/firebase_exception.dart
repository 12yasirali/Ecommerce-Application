class YFirebaseException implements Exception {
  final String code;

  YFirebaseException(this.code);

  String get message {
    switch (code) {
      case "unknown":
        return "An unknown Firebase error occurred. please try again";
      case "Invalid-custom-token":
        return "The custom token format is incorrect. please check your custom token.";
      case "custom-token-mismatch":
        return "The custom token corresponds to a different audience.";
      case "user-disabled":
        return "The user account has been disabled";
      case "user-not-found":
        return "No user found for the given email or Uid.";
      case "Invalid-email":
        return "The email address provided is invalid. please enter a valid email";
      case "wrong-password":
        return "Incorrect password. Please check your password and try again";
      case "invalid-verification-code":
        return "Invalid verification code. please enter a valid code.";
      case "weak-password":
        return "The password is too weak. Please choose a stronger password";
      case "provider-already-linked":
        return "The account already linked with another provider.";
      case "operation-not-allowed":
        return "The operation not allowed. Contact support for assistance";
      default:
        return "User with this email already exist";
    }
  }
}
