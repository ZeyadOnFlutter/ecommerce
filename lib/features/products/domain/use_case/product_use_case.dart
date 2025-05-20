import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductUseCase {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);
  Future<Either<Faliure, List<Product>>> call(
    int limit,
    int page,
    String? categoryId,
  ) =>
      _productRepository.getProducts(limit, page, categoryId);
}
