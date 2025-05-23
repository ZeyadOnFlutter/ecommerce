import 'package:ecommerce/features/home/data/mappers/categories_mapper.dart';
import 'package:ecommerce/features/products/data/mappers/brand_mapper.dart';
import 'package:ecommerce/features/products/data/models/specific_product_response.dart';
import 'package:ecommerce/features/products/domain/entities/specific_product.dart';

extension SpecifiProductMapper on SpecificProductModel {
  SpecificProduct get toEntity => SpecificProduct(
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
        brand: brand.toEntity,
        ratingsAverage: ratingsAverage,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
        reviews: reviews,
        dataId: dataId,
      );
}
