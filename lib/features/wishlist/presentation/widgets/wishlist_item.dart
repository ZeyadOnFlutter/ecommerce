import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/widgets/heart_button.dart';
import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({required this.wishlistItem});

  final GetWishlist wishlistItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.productDetails,
      ),
      child: Container(
        height: Sizes.s135.h,
        padding: EdgeInsetsDirectional.only(end: Sizes.s8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.s16.r),
          border: Border.all(color: ColorManager.primary.withOpacity(.3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.s16.r),
                border: Border.all(color: ColorManager.primary.withOpacity(.6)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.s16.r),
                child: CachedNetworkImage(
                  width: Sizes.s120.w,
                  height: Sizes.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: wishlistItem.imageCover,
                  placeholder: (_, __) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (_, __, ___) => const Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: Insets.s8.w),
                child: WishlistItemDetails(
                  wishlistItem: wishlistItem,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                  productId: wishlistItem.id,
                  onTap: () {},
                ),
                SizedBox(height: Sizes.s14.h),
                AddToCartButton(
                  onPressed: () {},
                  text: 'Add to Cart',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
