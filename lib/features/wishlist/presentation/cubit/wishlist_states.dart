import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';

abstract class WishListStates {}

class WishListInitial extends WishListStates {}

class AddProductToWishListLoading extends WishListStates {}

class AddProductToWishListSuccess extends WishListStates {
  final WishList wishList;
  final List<GetWishlist> updatedWishlist;

  AddProductToWishListSuccess(this.wishList, this.updatedWishlist);
}

class AddProductToWishListError extends WishListStates {
  final String errorMessage;

  AddProductToWishListError(this.errorMessage);
}

class DeleteProductFromWishListListLoading extends WishListStates {}

class DeleteProductFromWishListSuccess extends WishListStates {
  final WishList wishList;
  final List<GetWishlist> updatedWishlist;

  DeleteProductFromWishListSuccess(this.wishList, this.updatedWishlist);
}

class DeleteProductFromWishListError extends WishListStates {
  final String errorMessage;

  DeleteProductFromWishListError(this.errorMessage);
}

class GetUserWishListLoading extends WishListStates {}

class GetUserWishListSuccess extends WishListStates {
  final List<GetWishlist> wishList;

  GetUserWishListSuccess(this.wishList);
}

class GetUserWishListError extends WishListStates {
  final String errorMessage;

  GetUserWishListError(this.errorMessage);
}
