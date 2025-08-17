class GetWishlist {
  GetWishlist({
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
}
