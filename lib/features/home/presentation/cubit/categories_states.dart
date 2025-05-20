import 'package:ecommerce/features/home/domain/entities/categories.dart';

abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}

class CategoriesLoading extends CategoriesStates {}

class CategoriesError extends CategoriesStates {
  final String errorMessage;

  CategoriesError(this.errorMessage);
}

class CategoriesSuccess extends CategoriesStates {
  final List<Categories> categories;

  CategoriesSuccess(this.categories);
}
