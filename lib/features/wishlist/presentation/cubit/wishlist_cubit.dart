import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/use_case/add_product_to_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/domain/use_case/delete_product_from_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/domain/use_case/get_wishlist_use_case.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WishListCubit extends Cubit<WishListStates> {
  WishListCubit(
    this._addProductToWishlistUseCase,
    this._getWishlistUseCase,
    this._deleteProductFromWishlistUseCase,
  ) : super(WishListInitial());

  final AddProductToWishlistUseCase _addProductToWishlistUseCase;
  final GetWishlistUseCase _getWishlistUseCase;
  final DeleteProductFromWishlistUseCase _deleteProductFromWishlistUseCase;

  WishList? myWishList;
  List<GetWishlist> allWishList = [];

  Future<void> addProductToWishlist(String productId) async {
    emit(AddProductToWishListLoading());

    final response = await _addProductToWishlistUseCase(productId);
    await response.fold(
      (errorMessage) async {
        emit(AddProductToWishListError(errorMessage.message));
      },
      (updatedwishlist) async {
        myWishList = updatedwishlist;

        final wishlistResponse = await _getWishlistUseCase();
        wishlistResponse.fold(
          (errorMessage) => emit(GetUserWishListError(errorMessage.message)),
          (wishList) {
            allWishList = wishList;
            emit(AddProductToWishListSuccess(updatedwishlist, wishList));
          },
        );
      },
    );
  }

  Future<void> getUserWishList() async {
    emit(GetUserWishListLoading());
    final response = await _getWishlistUseCase();
    response.fold(
      (errorMessage) => emit(GetUserWishListError(errorMessage.message)),
      (wishList) {
        allWishList = wishList;
        emit(GetUserWishListSuccess(wishList));
      },
    );
  }

  Future<void> deleteProductFromWishlist(String productId) async {
    emit(DeleteProductFromWishListListLoading());
    final response = await _deleteProductFromWishlistUseCase(productId);
    response.fold(
      (faliure) {
        emit(DeleteProductFromWishListError(faliure.message));
      },
      (updatedwishlist) async {
        myWishList = updatedwishlist;
        final wishlistResponse = await _getWishlistUseCase();
        wishlistResponse.fold(
          (faliure) {
            emit(GetUserWishListError(faliure.message));
          },
          (getwishlist) {
            allWishList = getwishlist;
            emit(
              DeleteProductFromWishListSuccess(updatedwishlist, getwishlist),
            );
          },
        );
      },
    );
  }
}
