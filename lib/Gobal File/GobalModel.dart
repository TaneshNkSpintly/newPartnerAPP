// message_response.dart
class MessageResponse {
  final String type;
  final ErrorMessage? errorMessage;
  final String? successMessage;

  MessageResponse({
    required this.type,
    required this.errorMessage,
    required this.successMessage,
  });

  factory MessageResponse.fromJsonError(Map<String, dynamic> json) {
    final message = json['message'];

    if (message is String) {
      return MessageResponse(
        type: json['type'] ?? "",
        successMessage: null,
        errorMessage: ErrorMessage(
          errorCode: 0, // Set an appropriate default value
          errorMessage: message,
        ),
      );
    } else if (message is Map<String, dynamic>) {
      return MessageResponse(
        type: json['type'] ?? "",
        successMessage: null,
        errorMessage: ErrorMessage.fromJson(message),
      );
    } else {
      print("Unknown message format");
      throw FormatException("Unknown message format");
    }
  }

  factory MessageResponse.fromJsonOnSuccess(Map<String, dynamic> json) {
    final message = json['message'];

    if (message is String) {
      return MessageResponse(
        type: json['type'] ?? "",
        successMessage: message,
        errorMessage: null,
      );
    } else if (message is Map<String, dynamic>) {
      return MessageResponse(
        type: json['type'] ?? "",
        successMessage: null,
        errorMessage: null,
      );
    } else {
      print("Unknown message format");
      throw FormatException("Unknown message format");
    }
  }
}

// error_message.dart
class ErrorMessage {
  final int errorCode;
  final String errorMessage;

  ErrorMessage({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      errorCode: json['errorCode'],
      errorMessage: json['errorMessage'],
    );
  }
}
