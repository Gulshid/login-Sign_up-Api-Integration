class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String to_string() {
    return "Prefix : $_prefix and Message : $_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During Communiction');
}


class BadRequestException extends AppException {
  BadRequestException([String? message])
    : super(message, 'Invalid Request');
}


class UnAuthException extends AppException {
  UnAuthException([String? message])
    : super(message, 'UnAuthorize Exception');
}


class InvalidInputException extends AppException {
  InvalidInputException([String? message])
    : super(message, 'Invalid Input');
}


