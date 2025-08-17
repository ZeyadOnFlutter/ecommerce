import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetWishlistUseCase {
  final WishListRepository _wishListRepository;

  GetWishlistUseCase(this._wishListRepository);

  Future<Either<Faliure, List<GetWishlist>>> call() =>
      _wishListRepository.getUserWishList();
}
