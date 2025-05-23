import 'package:ecommerce/features/products/data/models/specific_product_response.dart';
import 'package:ecommerce/features/products/domain/entities/brand.dart';

extension BrandMapper on BrandModel {
  Brand get toEntity => Brand(
        id: id,
        name: name,
        slug: slug,
        image: image,
      );
}
