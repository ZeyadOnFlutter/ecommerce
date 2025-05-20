import 'package:ecommerce/features/home/data/mappers/categories_mapper.dart';
import 'package:ecommerce/features/products/data/models/product_reponse.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

extension ProductMapper on ProductModel {
  Product get toEntity => Product(
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
        category: category.toEntity,
        brand: brand,
        ratingsAverage: ratingsAverage,
        createdAt: createdAt,
        updatedAt: updatedAt,
        productId: productId,
      );
}
