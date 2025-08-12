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

class SubCategoriesLoading extends CategoriesStates {}

class SubCategoriesError extends CategoriesStates {
  final String errorMessage;

  SubCategoriesError(this.errorMessage);
}

class SubCategoriesSuccess extends CategoriesStates {
  final List<Categories> categories;

  SubCategoriesSuccess(this.categories);
}
