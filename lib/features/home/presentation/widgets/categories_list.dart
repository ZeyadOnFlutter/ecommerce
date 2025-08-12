import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_states.dart';
import 'package:ecommerce/features/home/presentation/cubit/selectedcategory_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/subcategories_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList();

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final subCategoryCubit = getIt<SubcategoriesCubit>();
  final selectedCategoryCubit = getIt<SelectedCategoryCubit>();
  final categoryCubit = getIt<CategoriesCubit>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerGray,
          border: BorderDirectional(
            top: BorderSide(
              width: Sizes.s2,
              color: ColorManager.primary.withOpacity(0.3),
            ),
            start: BorderSide(
              width: Sizes.s2,
              color: ColorManager.primary.withOpacity(0.3),
            ),
            bottom: BorderSide(
              width: Sizes.s2,
              color: ColorManager.primary.withOpacity(0.3),
            ),
          ),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(Sizes.s12.r),
            bottomStart: Radius.circular(Sizes.s12.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(Sizes.s12.r),
            bottomStart: Radius.circular(Sizes.s12.r),
          ),
          child: BlocBuilder<CategoriesCubit, CategoriesStates>(
            builder: (context, state) {
              if (state is CategoriesLoading) {
                return const LoadingIndicator();
              } else if (state is CategoriesError) {
                return const ErrorIndicator();
              } else if (state is CategoriesSuccess) {
                return ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (_, index) =>
                      BlocSelector<SelectedCategoryCubit, int, int>(
                    selector: (state) {
                      return state;
                    },
                    builder: (context, selectedindex) {
                      return CategoryTextItem(
                        index,
                        state.categories[index].name,
                        selectedindex == index,
                        onItemClick,
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }

  void onItemClick(int index) {
    selectedCategoryCubit.onCategoryClicked(index);
    subCategoryCubit.getSubCategories(
      categoryCubit.mycategories[selectedCategoryCubit.state].id,
    );
  }
}
