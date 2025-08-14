import 'package:ecommerce/features/products/presentation/cubit/product_quantity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductQuantityCubit extends Cubit<ProductQuantityState> {
  ProductQuantityCubit() : super(ProductQuantityState(1));
  void onIncrement(int counter) =>
      emit(ProductQuantityState(state.productQuantity + 1));
  void onDecrement(int counter) {
    if (state.productQuantity == 1) return;
    emit(ProductQuantityState(state.productQuantity - 1));
  }

  void onReset() => emit(ProductQuantityState(1));
}
