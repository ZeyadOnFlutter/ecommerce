import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/wishlist/domain/entities/get_wishlist_entity.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/custom_auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemDetails extends StatelessWidget {
  const WishlistItemDetails({required this.wishlistItem});

  final GetWishlist wishlistItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomAutoSizeText(
          data: wishlistItem.title,
          textStyle: getSemiBoldStyle(
            color: ColorManager.primaryDark,
            fontSize: FontSize.s18,
          ),
        ),
        Row(
          children: [
            CustomAutoSizeText(
              data: 'EGP ${wishlistItem.price}  ',
              textStyle: getSemiBoldStyle(
                color: ColorManager.primaryDark,
                fontSize: FontSize.s18,
              ).copyWith(
                letterSpacing: 0.17,
              ),
            ),
            // ignore: unnecessary_null_comparison
            wishlistItem.priceAfterDiscount == null
                ? const SizedBox.shrink()
                : Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Sizes.s10.h,
                        ),
                        CustomAutoSizeText(
                          data: 'EGP ${wishlistItem.priceAfterDiscount}',
                          textStyle: getMediumStyle(
                            color: ColorManager.appBarTitle.withOpacity(.6),
                          ).copyWith(
                            letterSpacing: 0.17,
                            decoration: TextDecoration.lineThrough,
                            color: ColorManager.appBarTitle.withOpacity(.6),
                            fontSize: FontSize.s10,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
