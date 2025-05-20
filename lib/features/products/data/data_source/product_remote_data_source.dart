import 'package:ecommerce/features/products/data/models/product_reponse.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse> getProducts(int limit, int page, String? categoryId);
}
