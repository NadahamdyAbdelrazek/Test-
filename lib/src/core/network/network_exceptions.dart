import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/methods.dart';
import 'failure_message.dart';

class NetworkExceptions {
  const NetworkExceptions();

  static NetworkExceptions handleResponse(Response? response) {
    List<String> errors = [];
    if ((response?.data as Map<String, dynamic>).containsKey("errors")) {
      (response?.data["errors"] as Map<String, dynamic>).forEach((key, value) {
        errors.add("${value.first}\n");
      });
    } else {
      errors.add(response?.data["message"]);
    }

    String error = errors
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "")
        .trim();

    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
        return BadRequest(error);
      case 401 || 403:
        return UnauthorizedRequest(error);
      case 404:
        return NotFound(error);
      case 405:
        return const MethodNotAllowed();
      case 408:
        return const RequestTimeout();
      case 409:
        return Conflict(error);
      case 410:
        return PasswordWrong(error);
      case 422:
        return UnprocessableEntity(error);
      case 444:
        return TooManyRequests(error);
      case 407:
        return LowBalance(error);
      case 500:
        return const InternalServerError();
      case 503:
        return const ServiceUnavailable();
      case 505:
        return AnotherDeviceLoggedIn(error);
      default:
        int responseCode = statusCode;
        return DefaultError("Received invalid status code: $responseCode");
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const RequestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const RequestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions = const UnexpectedError();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const SendTimeout();
              break;
            case DioErrorType.response:
              networkExceptions = handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const SendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NoInternetConnection();
        } else {
          networkExceptions = const UnexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const FormatException();
      } catch (_) {
        return const UnexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        Methods.printLog("error =====> $error");
        return const UnableToProcess();
      } else {
        return const UnexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    String message = "";
    if (networkExceptions is NotFound) {
      message = networkExceptions.error;
    } else if (networkExceptions is NoInternetConnection) {
      message = FailureMessage.noInternetConnection;
    } else if (networkExceptions is RequestCancelled) {
      message = FailureMessage.requestCancelled;
    } else if (networkExceptions is InternalServerError) {
      message = FailureMessage.internalServerError;
    } else if (networkExceptions is ServiceUnavailable) {
      message = FailureMessage.serviceUnavailable;
    } else if (networkExceptions is MethodNotAllowed) {
      message = FailureMessage.methodAllowed;
    } else if (networkExceptions is BadRequest) {
      message = networkExceptions.error;
    } else if (networkExceptions is UnauthorizedRequest) {
      message = networkExceptions.error;
    } else if (networkExceptions is UnprocessableEntity) {
      message = networkExceptions.error;
    } else if (networkExceptions is UnexpectedError) {
      message = FailureMessage.unexpectedErrorOccurred;
    } else if (networkExceptions is RequestTimeout) {
      message = FailureMessage.connectionRequestTimeout;
    } else if (networkExceptions is Conflict) {
      message = networkExceptions.error;
    } else if (networkExceptions is SendTimeout) {
      message = FailureMessage.sendTimeoutInConnectionWithAPIServer;
    } else if (networkExceptions is UnableToProcess) {
      message = FailureMessage.unableToProcessTheData;
    } else if (networkExceptions is DefaultError) {
      message = networkExceptions.error;
    } else if (networkExceptions is FormatException) {
      message = FailureMessage.unexpectedErrorOccurred;
    } else if (networkExceptions is NotAcceptable) {
      message = FailureMessage.notAcceptable;
    } else if (networkExceptions is SiginGoogleException) {
      message = FailureMessage.googleError;
    } else if (networkExceptions is AnotherDeviceLoggedIn) {
      message = networkExceptions.error;
    } else if (networkExceptions is LowBalance) {
      message = networkExceptions.error;
    } else if (networkExceptions is PasswordWrong) {
      message = networkExceptions.error;
    } else if (networkExceptions is TooManyRequests) {
      message = networkExceptions.error;
    }

    return message;
  }
}

class RequestCancelled extends NetworkExceptions {
  const RequestCancelled();
}

class UnauthorizedRequest extends NetworkExceptions {
  final String error;
  const UnauthorizedRequest(this.error);
}

class BadRequest extends NetworkExceptions {
  final String error;

  const BadRequest(this.error);
}

class NotFound extends NetworkExceptions {
  final String error;
  const NotFound(this.error);
}

class MethodNotAllowed extends NetworkExceptions {
  const MethodNotAllowed();
}

class NotAcceptable extends NetworkExceptions {
  const NotAcceptable();
}

class RequestTimeout extends NetworkExceptions {
  const RequestTimeout();
}

class SendTimeout extends NetworkExceptions {
  const SendTimeout();
}

class UnprocessableEntity extends NetworkExceptions {
  final String error;

  const UnprocessableEntity(this.error);
}

class Conflict extends NetworkExceptions {
  final String error;

  const Conflict(this.error);
}

class InternalServerError extends NetworkExceptions {
  const InternalServerError();
}

class NotImplemented extends NetworkExceptions {
  const NotImplemented();
}

class ServiceUnavailable extends NetworkExceptions {
  const ServiceUnavailable();
}

class NoInternetConnection extends NetworkExceptions {
  const NoInternetConnection();
}

class FormatException extends NetworkExceptions {
  const FormatException();
}

class UnableToProcess extends NetworkExceptions {
  const UnableToProcess();
}

class DefaultError extends NetworkExceptions {
  final String error;

  const DefaultError(this.error);
}

class UnexpectedError extends NetworkExceptions {
  const UnexpectedError();
}

class SiginGoogleException extends NetworkExceptions {
  const SiginGoogleException();
}

class TooManyRequests extends NetworkExceptions {
  final String error;

  const TooManyRequests(this.error);
}

class PasswordWrong extends NetworkExceptions {
  final String error;
  const PasswordWrong(this.error);
}

class LowBalance extends NetworkExceptions {
  final String error;
  const LowBalance(this.error);
}

class AnotherDeviceLoggedIn extends NetworkExceptions {
  final String error;
  const AnotherDeviceLoggedIn(this.error);
}
