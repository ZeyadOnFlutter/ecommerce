import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/use_case/product_use_case.dart';
import 'package:ecommerce/features/products/presentation/cubit/produc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(
    this._productUseCase,
  ) : super(ProductInitial());
  final ProductUseCase _productUseCase;

  int page = 1;
  bool isLoading = false;
  bool hasMoreData = true;
  List<Product> products = [];

  Future<void> getProducts(
    int limit,
    String? categoryId, [
    bool isPagination = false,
  ]) async {
    if (isLoading || !hasMoreData) return;
    isLoading = true;
    if (!isPagination) {
      emit(ProductLoading());
      page = 1;
      hasMoreData = true;
      products.clear();
    }
    final response = await _productUseCase(limit, page, categoryId);
    response.fold(
      (faliure) {
        emit(ProductError(faliure.message));
        isLoading = false;
      },
      (myproducts) {
        products.addAll(myproducts);
        page++;
        emit(ProductSuccess(products));
        hasMoreData = myproducts.length == limit;
        isLoading = false;
      },
    );
  }

  void resetProducts() {
    page = 1;
    isLoading = false;
    hasMoreData = true;
    products.clear();
  }
}
