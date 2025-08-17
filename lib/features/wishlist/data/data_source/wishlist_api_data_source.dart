import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/api_error_handler.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/models/get_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistApiDataSource implements WishlistRemoteDataSource {
  final Dio _mainDio;

  WishlistApiDataSource(@Named('MainDio') this._mainDio);

  @override
  Future<WishListResponse> addProductToWishlist(String productId) async {
    try {
      final response = await _mainDio.post(
        ApiManager.wishlistEndPoint,
        data: {
          "productId": productId,
        },
      );
      return WishListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<GetWishListResponse> getUserWishList() async {
    try {
      final response = await _mainDio.get(
        ApiManager.wishlistEndPoint,
      );
      return GetWishListResponse.fromJson(response.data);
    } on DioException catch (e) {
      log(ApiErrorHandler.handleDioError(e).message.toString());
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      log(e.toString());
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<WishListResponse> deleteProductFromWishlist(String productId) async {
    try {
      final response = await _mainDio.delete(
        '${ApiManager.wishlistEndPoint}/$productId',
      );
      return WishListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
