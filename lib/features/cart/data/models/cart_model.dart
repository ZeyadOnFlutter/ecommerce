import 'package:ecommerce/features/cart/data/models/cart_item.dart';

class CartModel {
  const CartModel({
    required this.id,
    required this.cartOwner,
    required this.cartItem,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  final String? id;
  final String? cartOwner;
  final List<CartItemModel> cartItem;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int totalCartPrice;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["_id"] ?? "",
      cartOwner: json["cartOwner"] ?? "",
      cartItem: List<CartItemModel>.from(
        json["products"].map((x) => CartItemModel.fromJson(x)),
      ),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
      totalCartPrice: json["totalCartPrice"] ?? 0,
    );
  }
}
