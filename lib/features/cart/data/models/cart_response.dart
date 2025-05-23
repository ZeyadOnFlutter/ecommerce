import 'package:ecommerce/features/cart/data/models/cart_model.dart';

class CartResponse {
  const CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cartModel,
  });

  final String status;
  final int numOfCartItems;
  final String? cartId;
  final CartModel cartModel;

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json["status"] ?? "",
      numOfCartItems: json["numOfCartItems"] ?? 0,
      cartId: json["cartId"] ?? "",
      cartModel: CartModel.fromJson(json["data"]),
    );
  }
}
