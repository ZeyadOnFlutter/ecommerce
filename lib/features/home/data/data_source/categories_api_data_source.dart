import 'package:dio/dio.dart';
import 'package:ecommerce/core/error/api_error_handler.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/resources/api_manager.dart';
import 'package:ecommerce/features/home/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/categories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesApiDataSource implements CategoriesRemoteDataSource {
  final Dio _mainDio;

  CategoriesApiDataSource(
    @Named('MainDio') this._mainDio,
  );
  @override
  Future<AllCategoriesResponse> getAllCategories() async {
    try {
      final response = await _mainDio.get(
        ApiManager.categoriesEndPoint,
      );
      return AllCategoriesResponse.fromJson(response.data);
    } on DioException catch (dioException) {
      throw ApiErrorHandler.handleDioError(dioException);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  @override
  Future<AllCategoriesResponse> getSubCategories(String categoryId) async {
    try {
      final response = await _mainDio
          .get('${ApiManager.categoriesEndPoint}/$categoryId/subcategories');
      return AllCategoriesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorHandler.handleDioError(e);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
