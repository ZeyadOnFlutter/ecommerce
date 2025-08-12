import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/api_error_handler.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/auth_response.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiDataSource implements AuthRemoteDataSource {
  final Dio _mainDio;

  AuthApiDataSource(
    @Named('MainDio') this._mainDio,
  );
  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _mainDio.post(
        ApiManager.signUpEndPoint,
        data: registerRequest.toJson(),
      );
      log(response.data.toString());
      return AuthResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      log(dioException.response?.data.toString() ?? '');
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _mainDio.post(
        ApiManager.signInEndPoint,
        data: loginRequest.toJson(),
      );
      return AuthResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
