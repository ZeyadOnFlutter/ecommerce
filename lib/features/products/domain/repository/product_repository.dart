import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Faliure, List<Product>>> getProducts(
    int limit,
    int page,
    String? categoryId,
  );
}
