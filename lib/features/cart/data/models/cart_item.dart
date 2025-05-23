import 'package:ecommerce/features/cart/data/models/cart_product.dart';

class CartItemModel {
  const CartItemModel({
    required this.count,
    required this.id,
    required this.cartProduct,
    required this.price,
  });

  final int count;
  final String id;
  final CartProductModel cartProduct;
  final int price;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      count: json["count"] ?? 0,
      id: json["_id"] ?? "",
      cartProduct: CartProductModel.fromJson(json["product"]),
      price: json["price"] ?? 0,
    );
  }
}
