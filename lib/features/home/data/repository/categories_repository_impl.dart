import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/home/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce/features/home/data/mappers/categories_mapper.dart';
import 'package:ecommerce/features/home/domain/entities/categories.dart';
import 'package:ecommerce/features/home/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  const CategoriesRepositoryImpl(this._categoriesRemoteDataSource);
  @override
  Future<Either<Faliure, List<Categories>>> getCategories() async {
    try {
      final response = await _categoriesRemoteDataSource.getAllCategories();
      return Right(response.data.map((e) => e.toEntity).toList());
    } on EcommerceAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
