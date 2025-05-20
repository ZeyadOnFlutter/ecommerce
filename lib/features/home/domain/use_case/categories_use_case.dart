import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/home/domain/entities/categories.dart';
import 'package:ecommerce/features/home/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  const CategoriesUseCase(this._categoriesRepository);
  Future<Either<Faliure, List<Categories>>> call() =>
      _categoriesRepository.getCategories();
}
