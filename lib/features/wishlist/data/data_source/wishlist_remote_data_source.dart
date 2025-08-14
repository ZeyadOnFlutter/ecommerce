import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishListResponse> addProductToWishlist(String productId);
}
