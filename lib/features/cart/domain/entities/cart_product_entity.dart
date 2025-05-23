import 'package:ecommerce/features/home/domain/entities/categories.dart';

class CartProductEntity {
  const CartProductEntity({
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.productId,
  });

  final String id;
  final String title;
  final int quantity;
  final String imageCover;
  final Categories category;
  final dynamic brand;
  final double ratingsAverage;
  final String productId;
}
