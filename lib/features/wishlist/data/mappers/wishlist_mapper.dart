import 'package:ecommerce/features/wishlist/data/models/wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';

extension WishlistMapper on WishListResponse {
  WishList get toEntity => WishList(productIds: productIds);
}
