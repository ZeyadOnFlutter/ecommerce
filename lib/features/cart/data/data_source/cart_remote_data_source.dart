import 'package:ecommerce/features/cart/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId);
  Future<CartResponse> getFromCart();
  Future<CartResponse> updateCart(String productId, int count);
  Future<CartResponse> deleteFromCart(String productId);
}
