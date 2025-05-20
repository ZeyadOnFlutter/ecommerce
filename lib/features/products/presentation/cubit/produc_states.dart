import 'package:ecommerce/features/products/domain/entities/product.dart';

abstract class ProductStates {}

class ProductInitial extends ProductStates {}

class ProductLoading extends ProductStates {}

class ProductError extends ProductStates {
  final String errorMessage;

  ProductError(this.errorMessage);
}

class ProductSuccess extends ProductStates {
  final List<Product> products;

  ProductSuccess(this.products);
}

class ChnagedProductQuantity extends ProductStates {}
