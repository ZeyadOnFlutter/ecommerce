import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/api_error_handler.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/features/products/data/data_source/product_remote_data_source.dart';
import 'package:ecommerce/features/products/data/models/product_reponse.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductApiDataSource implements ProductRemoteDataSource {
  final Dio _mainDio;

  ProductApiDataSource(
    @Named('MainDio') this._mainDio,
  );

  @override
  Future<ProductResponse> getProducts(
    int limit,
    int page,
    String? categoryId,
  ) async {
    try {
      final response = await _mainDio.get(
        ApiManager.productsEndPoint,
        queryParameters: categoryId == null
            ? {
                'limit': limit.toString(),
                'page': page.toString(),
              }
            : {
                'category': categoryId,
                'limit': limit.toString(),
                'page': page.toString(),
              },
      );
      return ProductResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteExpetion(e.toString());
    }
  }
}
