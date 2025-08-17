import 'package:ecommerce/features/wishlist/data/models/get_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishListResponse> addProductToWishlist(String productId);
  Future<WishListResponse> deleteProductFromWishlist(String productId);
  Future<GetWishListResponse> getUserWishList();
}
