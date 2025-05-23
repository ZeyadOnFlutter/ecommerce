import 'package:ecommerce/features/cart/domain/entities/cart_product_entity.dart';

class CartItemEntity {
  const CartItemEntity({
    required this.count,
    required this.id,
    required this.cartProduct,
    required this.price,
  });

  final int count;
  final String id;
  final CartProductEntity cartProduct;
  final int price;
}
