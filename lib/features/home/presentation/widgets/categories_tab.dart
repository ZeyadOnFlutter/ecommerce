import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/features/home/presentation/cubit/selectedcategory_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/categories_list.dart';
import 'package:ecommerce/features/home/presentation/widgets/sub_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.s12.w,
        vertical: Insets.s12.h,
      ),
      child: BlocProvider.value(
        value: getIt<SelectedCategoryCubit>(),
        child: Row(
          children: [
            const CategoriesList(),
            SizedBox(
              width: Sizes.s16.w,
            ),
            const SubCategoriesList(),
          ],
        ),
      ),
    );
  }
}
