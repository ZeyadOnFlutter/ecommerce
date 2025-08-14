class WishListResponse {
  WishListResponse({
    required this.status,
    required this.message,
    required this.productIds,
  });

  final String? status;
  final String? message;
  final List<String> productIds;

  factory WishListResponse.fromJson(Map<String, dynamic> json) {
    return WishListResponse(
      status: json["status"],
      message: json["message"],
      productIds: List<String>.from(json["data"]!.map((x) => x)),
    );
  }
}
