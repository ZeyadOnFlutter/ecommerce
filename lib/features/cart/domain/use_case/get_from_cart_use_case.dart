import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFromCartUseCase {
  final CartRepository _cartRepository;

  GetFromCartUseCase(this._cartRepository);
  Future<Either<Faliure, CartModelEntity>> call() =>
      _cartRepository.getFromCart();
}
