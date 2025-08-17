import 'package:ecommerce/features/wishlist/data/models/get_wishlist_response.dart';
import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';

extension GetWishListMapper on WishListModel {
  GetWishlist get toEntity => GetWishlist(
        sold: sold,
        images: images,
        ratingsQuantity: ratingsQuantity,
        id: id,
        title: title,
        slug: slug,
        description: description,
        quantity: quantity,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        imageCover: imageCover,
        ratingsAverage: ratingsAverage,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
        wishlistId: wishlistId,
      );
}
