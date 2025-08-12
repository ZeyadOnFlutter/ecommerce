import 'package:ecommerce/features/home/data/models/categories.dart';

abstract class CategoriesRemoteDataSource {
  Future<AllCategoriesResponse> getAllCategories();
  Future<AllCategoriesResponse> getSubCategories(String categoryId);
}
