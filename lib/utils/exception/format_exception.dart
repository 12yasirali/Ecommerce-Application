class YFormatException implements Exception {
  final String message;

  YFormatException(
      [this.message =
          "An unexpected format error occurred. Please check your input."]);

  factory YFormatException.fromMessage(String message) {
    return YFormatException(message);
  }
  String get formattedMessage => message;

  factory YFormatException.fromCode(String code) {
    switch (code) {
      case "Invalid-email-format":
        return YFormatException(
            "The email address format is invalid. please enter a valid email.");
      case "Invalid-phone-number-format":
        return YFormatException(
            "The provided phone number format is invalid. please enter a valid phone number.");
      case "Invalid-date-format":
        return YFormatException(
            "The date format is invalid. please enter a valid date.");
      case "Invalid-url-format":
        return YFormatException(
            "The Url format is invalid. please enter a valid url.");
      case "Invalid-credit-card-format":
        return YFormatException(
            "The credit card format is invalid. please enter a valid credit card number.");
      case "Invalid-numeric-format":
        return YFormatException("The input should be a valid numeric format.");
      default:
        return YFormatException("The input value should have a valid format");
    }
  }
}
