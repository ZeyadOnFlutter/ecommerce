import 'package:ecommerce/core/models/category_model.dart';

class CartProductModel {
  const CartProductModel({
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
  final CategoriesModel category;
  final dynamic brand;
  final double ratingsAverage;
  final String productId;

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      quantity: json["quantity"] ?? 0,
      imageCover: json["imageCover"] ?? "",
      category: CategoriesModel.fromJson(json["category"]),
      brand: json["brand"],
      ratingsAverage: (json["ratingsAverage"] is int)
          ? (json["ratingsAverage"] as int).toDouble()
          : (json["ratingsAverage"] ?? 0.0),
      productId: json["id"] ?? "",
    );
  }
}
