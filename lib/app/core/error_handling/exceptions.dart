class AppException implements Exception {
  AppException([this.code, this.prefix, this.message]);

  final dynamic message;
  final dynamic prefix;
  final dynamic code;

  @override
  String toString() {
    return "$prefix | $message | $code";
  }
}

class ExceptionResponse {
  static dynamic title(dynamic error) {
    try {
      final splitted = error.toString().split(' | ');
      error = splitted[0];
      return error;
    } catch (e) {
      return error;
    }
  }

  static dynamic message(dynamic message, [int indexMessage = 1]) {
    try {
      final splitted = message.toString().split(' | ');
      message = splitted[indexMessage];
      return message;
    } catch (e) {
      return message;
    }
  }

  static int statusCode(dynamic statusCode) {
    try {
      final splitted = statusCode.toString().split(' | ');
      statusCode = splitted[2];
      return int.parse(statusCode);
    } catch (e) {
      return 0;
    }
  }
}

/// Status Code : 400
/// Bad Request
class BadRequestException extends AppException {
  BadRequestException([message]) : super(400, "Invalid Request", message);
}

/// Invalid Input
class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(400, "Invalid Input", message);
}

/// Status Code : 401
/// Unauthorized
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(401, "Unauthorised", message);
}

/// Status Code : 404
/// Not Found
class NotFoundException extends AppException {
  NotFoundException([message]) : super(404, "Not Found", message);
}

/// Status Code : 413
/// Request Entity Too Large
class RequestEntityException extends AppException {
  RequestEntityException([message])
      : super(413, "Request Entity Too Large", message);
}

/// For Server Error
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(500, "Internal Server Error", message);
}

/// For Connection Error
class NoInternetException extends AppException {
  NoInternetException()
      : super(
          12001,
          "Tidak ada koneksi internet!",
          "Gagal memuat data, silahkan coba lagi...",
        );
}
