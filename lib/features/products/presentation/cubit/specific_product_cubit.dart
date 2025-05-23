import 'package:ecommerce/features/products/domain/use_case/specific_product_use_case.dart';
import 'package:ecommerce/features/products/presentation/cubit/produc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SpecificProductCubit extends Cubit<ProductStates> {
  SpecificProductCubit(this._specificProductUseCase) : super(ProductInitial());
  final SpecificProductUseCase _specificProductUseCase;
  Future<void> getSpecificProduct(String productId) async {
    emit(SpecificProductLoading());
    final response = await _specificProductUseCase(productId);
    response.fold(
      (errorMessage) => emit(
        SpecificProductError(errorMessage.message),
      ),
      (success) => emit(
        SpecificProductSuccess(success),
      ),
    );
  }
}
