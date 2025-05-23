import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/entities/specific_product.dart';

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

class SpecificProductLoading extends ProductStates {}

class SpecificProductError extends ProductStates {
  final String errorMessage;

  SpecificProductError(this.errorMessage);
}

class SpecificProductSuccess extends ProductStates {
  final SpecificProduct specificProduct;

  SpecificProductSuccess(this.specificProduct);
}
