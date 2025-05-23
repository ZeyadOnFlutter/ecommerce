import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/exception.dart';

class ApiErrorHandler {
  static EcommerceAppExceptions handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw const RemoteException(
          "Connection timeout. Please check your internet.",
        );
      case DioExceptionType.sendTimeout:
        throw const RemoteException(
          "Send timeout. The request took too long.",
        );
      case DioExceptionType.receiveTimeout:
        throw const RemoteException(
          "Receive timeout. Server response took too long.",
        );
      case DioExceptionType.badCertificate:
        throw const RemoteException(
          "Invalid SSL certificate. The connection is not secure.",
        );
      case DioExceptionType.badResponse:
        throw RemoteException(
          e.response?.data["message"],
        );
      case DioExceptionType.cancel:
        throw const RemoteException("Request was cancelled.");
      case DioExceptionType.connectionError:
        throw const RemoteException(
          "No internet connection. Please check your network.",
        );
      case DioExceptionType.unknown:
        throw RemoteException(
          "An unknown error occurred: ${e.message}",
        );
    }
  }
}
