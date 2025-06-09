import 'package:dio/dio.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/core/resources/shared_prefs_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  @Named('MainDio')
  Dio get mainDio {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiManager.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = getIt<SharedPreferences>();
          final token = prefs.getString(SharedPrefsManager.token);
          if (token != null) {
            options.headers[ApiManager.tokenKey] = token;
          }
          return handler.next(options);
        },
      ),
    );
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
