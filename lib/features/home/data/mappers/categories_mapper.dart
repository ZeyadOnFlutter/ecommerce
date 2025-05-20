import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/features/home/domain/entities/categories.dart';

extension CategoriesMapper on CategoriesModel {
  Categories get toEntity =>
      Categories(id, name, slug, image, createdAt, updatedAt);
}
