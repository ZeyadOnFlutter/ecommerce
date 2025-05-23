import 'package:ecommerce/features/cart/data/mappers/cart_item_mapper.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_model_entity.dart';

extension CartModelMapper on CartModel {
  CartModelEntity get toEntity => CartModelEntity(
        id: id,
        cartOwner: cartOwner,
        cartItem: cartItem.map((cartItem) => cartItem.toEntity).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
        totalCartPrice: totalCartPrice,
      );
}
