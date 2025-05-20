import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/features/home/domain/entities/categories.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.categories);
  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.products,
          arguments: categories.id,
        );
        getIt<ProductCubit>().getProducts(6, categories.id);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: categories.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: ColorManager.black,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            categories.name,
            style:
                getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
