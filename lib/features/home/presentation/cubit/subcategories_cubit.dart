import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/features/home/domain/use_case/subcategories_use_case.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_states.dart';
import 'package:ecommerce/features/home/presentation/cubit/selectedcategory_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubcategoriesCubit extends Cubit<CategoriesStates> {
  SubcategoriesCubit(this._subcategoriesUseCase) : super(CategoriesInitial()) {
    getSubCategories(
      getIt<CategoriesCubit>()
          .mycategories[getIt<SelectedCategoryCubit>().state]
          .id,
    );
  }
  final SubcategoriesUseCase _subcategoriesUseCase;

  Future<void> getSubCategories(String categoryId) async {
    emit(SubCategoriesLoading());
    final response = await _subcategoriesUseCase(categoryId);
    response.fold(
      (l) {
        emit(SubCategoriesError(l.message));
      },
      (r) {
        emit(SubCategoriesSuccess(r));
      },
    );
  }
}
