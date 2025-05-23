import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/api_error_handler.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiDataSource implements CartRemoteDataSource {
  final Dio _mainDio;
  final AuthLocalDataSource _authLocalDataSource;
  CartApiDataSource(
    @Named('MainDio') this._mainDio,
    this._authLocalDataSource,
  );
  @override
  Future<void> addToCart(String productId) async {
    try {
      await _mainDio.post(
        ApiManager.cartEndPoint,
        data: {
          "productId": productId,
        },
        options: Options(
          headers: {
            'token': await _authLocalDataSource.getToken(),
          },
        ),
      );
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<CartResponse> deleteFromCart(String productId) async {
    try {
      final response = await _mainDio.delete(
        '${ApiManager.cartEndPoint}/$productId',
        options: Options(
          headers: {
            'token': await _authLocalDataSource.getToken(),
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<CartResponse> getFromCart() async {
    try {
      final response = await _mainDio.get(
        ApiManager.cartEndPoint,
        options: Options(
          headers: {
            'token': await _authLocalDataSource.getToken(),
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int count) async {
    try {
      final response = await _mainDio.put(
        '${ApiManager.cartEndPoint}/$productId',
        data: {
          'count': count.toString(),
        },
        options: Options(
          headers: {
            'token': await _authLocalDataSource.getToken(),
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
