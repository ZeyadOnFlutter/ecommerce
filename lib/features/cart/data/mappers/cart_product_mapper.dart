import 'package:ecommerce/features/cart/data/models/cart_product.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_product_entity.dart';
import 'package:ecommerce/features/home/data/mappers/categories_mapper.dart';

extension CartProductMapper on CartProductModel {
  CartProductEntity get toEntity => CartProductEntity(
        id: id,
        title: title,
        quantity: quantity,
        imageCover: imageCover,
        category: category.toEntity,
        brand: brand,
        ratingsAverage: ratingsAverage,
        productId: productId,
      );
}
