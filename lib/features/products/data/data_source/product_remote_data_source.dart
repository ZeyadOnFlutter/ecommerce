import 'package:ecommerce/features/products/data/models/product_reponse.dart';
import 'package:ecommerce/features/products/data/models/specific_product_response.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponse> getProducts(int limit, int page, String? categoryId);
  Future<SpecificProductResponse> getSpecificProduct(String productId);
}
