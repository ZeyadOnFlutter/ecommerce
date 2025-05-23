import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/products/domain/entities/specific_product.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SpecificProductUseCase {
  final ProductRepository _productRepository;

  SpecificProductUseCase(this._productRepository);
  Future<Either<Faliure, SpecificProduct>> call(String productId) =>
      _productRepository.getSpecificProduct(productId);
}
