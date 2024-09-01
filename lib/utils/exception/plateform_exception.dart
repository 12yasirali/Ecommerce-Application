class YPlatformException implements Exception {
  final String code;

  YPlatformException(this.code);

  String get message {
    switch (code) {
      case "INVALID_LOGIN_CREDENTIALS":
        return "Invalid login credentials, Please double check your information";
      case "too-many-requests":
        return "Too many requests. please try again later";
      case "Invalid-arguments":
        return "Invalid argument provided to the authentication method";
      case "Invalid-password":
        return "Incorrect password.";
      case "Invalid-phone-number":
        return "The provided phone number is invalid";
      case "Operation not allowed":
        return "The sign in provider is disabled for your firebase project.";
      case "session-cookie-expired":
        return "The firebase session cookie has expired. Please sign in again.";
      case "uid-already-exists":
        return "The provided user Id is already in use by another user.";
      case "sign-in-failed":
        return "Sign in failed. Please try again later.";
      case "network-request-failed":
        return "network request failed. please check your internet connection";
      case "Internal-error":
        return "Internal error. Please try again";
      case "invalid-verification-code":
        return "Invalid verification code, Please enter a valid code";
      case "invalid-verification-id":
        return "The verification id of the user is not valid.";
      default:
        return "Platform exception occurred";
    }
  }
}
