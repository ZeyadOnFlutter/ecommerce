import 'package:dio/dio.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  @Named('MainDio')
  Dio get mainDio => Dio(
        BaseOptions(
          baseUrl: ApiManager.baseUrl,
          receiveDataWhenStatusError: true,
        ),
      );

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
