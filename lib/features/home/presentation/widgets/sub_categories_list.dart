import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/categories_states.dart';
import 'package:ecommerce/features/home/presentation/cubit/selectedcategory_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/subcategories_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/category_card_item.dart';
import 'package:ecommerce/features/home/presentation/widgets/sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: [
          BlocSelector<SelectedCategoryCubit, int, int>(
            selector: (state) {
              return state;
            },
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      getIt<CategoriesCubit>().mycategories[state].name,
                      style: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s14,
                      ),
                    ),
                    CategoryCardItem(
                      getIt<CategoriesCubit>().mycategories[state].name,
                      ImageAssets.categoryCardImage,
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<SubcategoriesCubit, CategoriesStates>(
              builder: (context, state) {
                if (state is SubCategoriesLoading) {
                  return const SliverToBoxAdapter(child: LoadingIndicator());
                } else if (state is SubCategoriesError) {
                  return const SliverToBoxAdapter(child: ErrorIndicator());
                } else if (state is SubCategoriesSuccess) {
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.categories.length,
                      (_, index) => SubCategoryItem(
                        state.categories[index].name,
                        ImageAssets.subcategoryCardImage,
                      ),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.73.r,
                      mainAxisSpacing: Sizes.s8.h,
                      crossAxisSpacing: Sizes.s8.w,
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
