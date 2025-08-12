import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/home/domain/entities/categories.dart';

abstract class CategoriesRepository {
  Future<Either<Faliure, List<Categories>>> getCategories();
  Future<Either<Faliure, List<Categories>>> getSubCategories(String categoryId);
}
