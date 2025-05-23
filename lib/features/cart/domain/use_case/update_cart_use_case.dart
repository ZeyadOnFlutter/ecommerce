import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateCartUseCase {
  final CartRepository _cartRepository;
  UpdateCartUseCase(this._cartRepository);

  Future<Either<Faliure, CartModelEntity>> call(String productId, int count) =>
      _cartRepository.updateCart(productId, count);
}
