import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/mappers/add_wishlist_mapper.dart';
import 'package:ecommerce/features/wishlist/data/mappers/get_wishlist_mapper.dart';
import 'package:ecommerce/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository {
  final WishlistRemoteDataSource _wishlistRemoteDataSource;

  WishListRepositoryImpl(this._wishlistRemoteDataSource);
  @override
  Future<Either<Faliure, WishList>> addProductToWishlist(
    String productId,
  ) async {
    try {
      final response =
          await _wishlistRemoteDataSource.addProductToWishlist(productId);
      return Right(response.toEntity);
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, List<GetWishlist>>> getUserWishList() async {
    try {
      final response = await _wishlistRemoteDataSource.getUserWishList();
      return Right(
        response.wishlistModel
            .map((wishlistmodel) => wishlistmodel.toEntity)
            .toList(),
      );
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, WishList>> deleteProductFromWishlist(
    String productId,
  ) async {
    try {
      final response =
          await _wishlistRemoteDataSource.deleteProductFromWishlist(productId);
      return Right(response.toEntity);
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
