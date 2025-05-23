import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';

abstract class CartRepository {
  Future<Either<Faliure, Unit>> addToCart(String productId);
  Future<Either<Faliure, CartModelEntity>> getFromCart();
  Future<Either<Faliure, CartModelEntity>> updateCart(
    String productId,
    int count,
  );
  Future<Either<Faliure, CartModelEntity>> deleteFromCart(String productId);
}
