import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';
import 'package:ecommerce/features/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_case/delete_from_cart_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_case/get_from_cart_use_case.dart';
import 'package:ecommerce/features/cart/domain/use_case/update_cart_use_case.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartStates> {
  CartCubit(
    this._addToCartUseCase,
    this._getFromCartUseCase,
    this._deleteFromCartUseCase,
    this._updateCartUseCase,
  ) : super(CartInitial());
  final AddToCartUseCase _addToCartUseCase;
  final GetFromCartUseCase _getFromCartUseCase;
  final DeleteFromCartUseCase _deleteFromCartUseCase;
  final UpdateCartUseCase _updateCartUseCase;
  late CartModelEntity cartModelEntity;
  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    final response = await _addToCartUseCase(productId);

    response.fold(
      (faliure) => emit(
        AddToCartError(faliure.message),
      ),
      (unit) {
        emit(AddToCartSuccess());
      },
    );
  }

  Future<void> getFromCart() async {
    emit(GetFromCartLoading());
    final response = await _getFromCartUseCase();

    response.fold(
      (faliure) => emit(
        GetFromCartError(faliure.message),
      ),
      (cartModel) {
        cartModelEntity = cartModel;
        emit(GetFromCartSuccess(cartModel));
      },
    );
  }

  Future<void> deleteFromCart(String productId) async {
    emit(DeleteFromCartLoading());
    final response = await _deleteFromCartUseCase(productId);

    response.fold(
      (faliure) => emit(
        DeleteFromCartError(faliure.message),
      ),
      (cartModel) {
        cartModelEntity = cartModel;
        emit(DeleteFromCartSuccess());
      },
    );
  }

  Future<void> updateCart(String productId, int count) async {
    emit(UpdateCartLoading());
    final response = await _updateCartUseCase(productId, count);

    response.fold(
      (faliure) => emit(
        UpdateCartError(faliure.message),
      ),
      (cartModel) {
        cartModelEntity = cartModel;
        emit(UpdateCartSuccess());
      },
    );
  }
}
