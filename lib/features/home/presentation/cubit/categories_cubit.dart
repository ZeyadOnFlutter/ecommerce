import 'package:ecommerce/features/home/domain/use_case/categories_use_case.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit(this._categoriesUseCase) : super(CategoriesInitial()) {
    getAllCategories();
  }
  final CategoriesUseCase _categoriesUseCase;

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    final response = await _categoriesUseCase();
    response.fold(
      (faliure) => emit(
        CategoriesError(faliure.message),
      ),
      (categories) => emit(
        CategoriesSuccess(categories),
      ),
    );
  }
}
