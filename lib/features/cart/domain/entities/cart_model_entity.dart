import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';

class CartModelEntity {
  const CartModelEntity({
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
  final List<CartItemEntity> cartItem;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int totalCartPrice;
}
