import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductToWishlistUseCase {
  final WishListRepository _wishListRepository;

  AddProductToWishlistUseCase(this._wishListRepository);

  Future<Either<Faliure, WishList>> call(String productId) =>
      _wishListRepository.addProductToWishlist(productId);
}
