import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/api_error_handler.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_request.dart';
import 'package:ecommerce/features/auth/data/models/regsiter_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiDataSource implements AuthRemoteDataSource {
  final Dio _mainDio;

  AuthApiDataSource(
    @Named('MainDio') this._mainDio,
  );
  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _mainDio.post(
        ApiManager.signUpEndPoint,
        data: registerRequest.toJson(),
      );
      log(response.data);
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      log(dioException.response?.data);
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }
}
