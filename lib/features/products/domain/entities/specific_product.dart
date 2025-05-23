import 'package:ecommerce/features/home/domain/entities/categories.dart';
import 'package:ecommerce/features/products/domain/entities/brand.dart';

class SpecificProduct {
  const SpecificProduct({
    required this.sold,
    required this.images,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.priceAfterDiscount,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.reviews,
    required this.dataId,
  });

  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final int priceAfterDiscount;
  final String imageCover;
  final Categories category;
  final Brand brand;
  final double ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;
  final List<dynamic> reviews;
  final String dataId;
}
