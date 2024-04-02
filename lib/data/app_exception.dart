class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? meaasge]) : super(meaasge, 'Invalid Request');
}

class UnautorisedException extends AppException {
  UnautorisedException([String? meaasge])
      : super(meaasge, 'Unauthorised Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid input');
}
