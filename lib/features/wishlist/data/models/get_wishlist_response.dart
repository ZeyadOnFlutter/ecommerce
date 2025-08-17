class GetWishListResponse {
  GetWishListResponse({
    required this.status,
    required this.count,
    required this.wishlistModel,
  });

  final String status;
  final int count;
  final List<WishListModel> wishlistModel;

  factory GetWishListResponse.fromJson(Map<String, dynamic> json) {
    return GetWishListResponse(
      status: json["status"] ?? "",
      count: json["count"] ?? 0,
      wishlistModel: json["data"] == null
          ? []
          : List<WishListModel>.from(
              json["data"]!.map((x) => WishListModel.fromJson(x)),
            ),
    );
  }
}

class WishListModel {
  WishListModel({
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
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.wishlistId,
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
  final double ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;
  final String wishlistId;

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
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
      ratingsAverage: (json["ratingsAverage"] is int)
          ? (json["ratingsAverage"] as int).toDouble()
          : (json["ratingsAverage"] ?? 0.0),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
      wishlistId: json["id"] ?? "",
    );
  }
}
