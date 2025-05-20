import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/core/models/metadata.dart';

class ProductResponse {
  const ProductResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  final int results;
  final Metadata? metadata;
  final List<ProductModel> data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      results: json["results"] ?? 0,
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      data: json["data"] == null
          ? []
          : List<ProductModel>.from(
              json["data"]!.map((x) => ProductModel.fromJson(x)),
            ),
    );
  }
}

class ProductModel {
  const ProductModel({
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
    required this.productId,
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
  final int? priceAfterDiscount;
  final String imageCover;
  final CategoriesModel category;
  final dynamic brand;
  final double ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String productId;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json["sold"] ?? 0,
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      ratingsQuantity: json["ratingsQuantity"] ?? 0,
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      slug: json["slug"] ?? "",
      description: json["description"] ?? "",
      quantity: json["quantity"] ?? 0,
      price: json["price"] ?? 0,
      priceAfterDiscount: json["priceAfterDiscount"] ?? 0,
      imageCover: json["imageCover"] ?? "",
      category: CategoriesModel.fromJson(json["category"]),
      brand: json["brand"],
      ratingsAverage: (json["ratingsAverage"] is int)
          ? (json["ratingsAverage"] as int).toDouble()
          : (json["ratingsAverage"] ?? 0.0),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      productId: json["id"] ?? "",
    );
  }
}
