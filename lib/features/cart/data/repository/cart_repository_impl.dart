import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/faliure.dart';
import 'package:ecommerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/mappers/cart_model_mapper.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);
  @override
  Future<Either<Faliure, Unit>> addToCart(String productId) async {
    try {
      await _cartRemoteDataSource.addToCart(productId);
      return const Right(unit);
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, CartModelEntity>> getFromCart() async {
    try {
      final response = await _cartRemoteDataSource.getFromCart();
      return Right(response.cartModel.toEntity);
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, CartModelEntity>> deleteFromCart(
    String productId,
  ) async {
    try {
      final response = await _cartRemoteDataSource.deleteFromCart(productId);
      return Right(response.cartModel.toEntity);
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, CartModelEntity>> updateCart(
    String productId,
    int count,
  ) async {
    try {
      final response = await _cartRemoteDataSource.updateCart(productId, count);
      return Right(response.cartModel.toEntity);
    } on RemoteException catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
