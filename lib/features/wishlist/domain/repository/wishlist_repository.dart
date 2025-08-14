import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishListRepository {
  Future<Either<Faliure, WishList>> addProductToWishlist(String productId);
}
