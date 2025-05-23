import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';

abstract class CartStates {}

class CartInitial extends CartStates {}

class AddToCartLoading extends CartStates {}

class AddToCartError extends CartStates {
  final String errorMessage;

  AddToCartError(this.errorMessage);
}

class AddToCartSuccess extends CartStates {}

class GetFromCartLoading extends CartStates {}

class GetFromCartError extends CartStates {
  final String errorMessage;

  GetFromCartError(this.errorMessage);
}

class GetFromCartSuccess extends CartStates {
  final CartModelEntity cartModelEntity;

  GetFromCartSuccess(this.cartModelEntity);
}

class DeleteFromCartLoading extends CartStates {}

class DeleteFromCartError extends CartStates {
  final String errorMessage;

  DeleteFromCartError(this.errorMessage);
}

class DeleteFromCartSuccess extends CartStates {}

class UpdateCartLoading extends CartStates {}

class UpdateCartError extends CartStates {
  final String errorMessage;

  UpdateCartError(this.errorMessage);
}

class UpdateCartSuccess extends CartStates {}
