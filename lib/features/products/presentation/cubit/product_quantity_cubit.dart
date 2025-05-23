import 'package:ecommerce/features/products/presentation/cubit/produc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductQuantityCubit extends Cubit<ProductStates> {
  ProductQuantityCubit() : super(ProductInitial());
  int productQuantity = 1;
  void changeProductQuantity(int newProductQuantity) {
    productQuantity = newProductQuantity;
    emit(ChnagedProductQuantity());
  }
}
