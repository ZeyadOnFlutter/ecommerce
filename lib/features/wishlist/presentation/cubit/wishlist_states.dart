import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishListStates {}

class WishListInitial extends WishListStates {}

class AddProductToWishListLoading extends WishListStates {}

class AddProductToWishListSuccess extends WishListStates {
  final WishList wishList;

  AddProductToWishListSuccess(this.wishList);
}

class AddProductToWishListError extends WishListStates {
  final String errorMessage;

  AddProductToWishListError(this.errorMessage);
}
