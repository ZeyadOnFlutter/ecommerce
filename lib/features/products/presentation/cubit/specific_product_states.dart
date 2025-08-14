import 'package:ecommerce/features/products/domain/entities/specific_product.dart';

abstract class SpecificProductStates {}

class SpecificProductInitial extends SpecificProductStates {}

class SpecificProductLoading extends SpecificProductStates {}

class SpecificProductError extends SpecificProductStates {
  final String errorMessage;

  SpecificProductError(this.errorMessage);
}

class SpecificProductSuccess extends SpecificProductStates {
  final SpecificProduct specificProduct;

  SpecificProductSuccess(this.specificProduct);
}
