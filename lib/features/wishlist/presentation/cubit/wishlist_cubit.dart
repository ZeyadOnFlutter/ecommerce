import 'package:ecommerce/features/wishlist/domain/use_case/add_product_to_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListCubit extends Cubit<WishListStates> {
  WishListCubit(this._addProductToWishlistUseCase) : super(WishListInitial());

  final AddProductToWishlistUseCase _addProductToWishlistUseCase;

  Future<void> addProductToWishlist(String productId) async {
    emit(AddProductToWishListLoading());
    final response = await _addProductToWishlistUseCase(productId);
    response.fold(
      (errorMessage) => emit(AddProductToWishListError(errorMessage.message)),
      (wishList) => emit(AddProductToWishListSuccess(wishList)),
    );
  }
}
