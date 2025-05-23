import 'package:ecommerce/features/cart/data/mappers/cart_product_mapper.dart';
import 'package:ecommerce/features/cart/data/models/cart_item.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';

extension CartItemMapper on CartItemModel {
  CartItemEntity get toEntity => CartItemEntity(
        count: count,
        id: id,
        cartProduct: cartProduct.toEntity,
        price: price,
      );
}
