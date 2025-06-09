import 'package:ecommerce/core/models/category_model.dart';

class SpecificProductResponse {
  const SpecificProductResponse({
    required this.data,
  });

  final SpecificProductModel data;

  factory SpecificProductResponse.fromJson(Map<String, dynamic> json) {
    return SpecificProductResponse(
      data: SpecificProductModel.fromJson(json["data"]),
    );
  }
}

class SpecificProductModel {
  const SpecificProductModel({
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
  final CategoriesModel category;
  final BrandModel brand;
  final double ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;
  final List<dynamic> reviews;
  final String dataId;

  factory SpecificProductModel.fromJson(Map<String, dynamic> json) {
    return SpecificProductModel(
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
      brand: BrandModel.fromJson(json["brand"]),
      ratingsAverage: (json["ratingsAverage"] is int)
          ? (json["ratingsAverage"] as int).toDouble()
          : (json["ratingsAverage"] ?? 0.0),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
      reviews: json["reviews"] == null
          ? []
          : List<dynamic>.from(json["reviews"]!.map((x) => x)),
      dataId: json["id"] ?? "",
    );
  }
}

class BrandModel {
  const BrandModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  final String id;
  final String name;
  final String slug;
  final String image;

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
    );
  }
}
