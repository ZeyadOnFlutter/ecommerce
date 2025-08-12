import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/home/domain/entities/categories.dart';
import 'package:ecommerce/features/home/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubcategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  const SubcategoriesUseCase(this._categoriesRepository);

  Future<Either<Faliure, List<Categories>>> call(String categoryId) =>
      _categoriesRepository.getSubCategories(categoryId);
}
