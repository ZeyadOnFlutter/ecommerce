import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/widgets/product_counter.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/specific_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem(this._cartItemEntity, this.index, this.productId);
  final CartItemEntity _cartItemEntity;
  final int index;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final cartCubit = context.read<CartCubit>();

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.productDetails,
        );
        getIt<SpecificProductCubit>().getSpecificProduct(productId);
      },
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border:
                    Border.all(color: ColorManager.primary.withOpacity(0.3)),
              ),
              child: CachedNetworkImage(
                imageUrl: _cartItemEntity.cartProduct.imageCover,
                fit: BoxFit.cover,
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.s8.w,
                  vertical: Insets.s8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _cartItemEntity.cartProduct.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.text,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => cartCubit
                              .deleteFromCart(_cartItemEntity.cartProduct.id),
                          child: Image.asset(
                            IconsAssets.delete,
                            color: ColorManager.text,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'EGP ${_cartItemEntity.price}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBoldStyle(
                              color: ColorManager.text,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                        ProductCounter(
                          initialValue: _cartItemEntity.count,
                          onIncrement: (quantity) => cartCubit.updateCart(
                            _cartItemEntity.cartProduct.id,
                            quantity,
                          ),
                          onDecrement: (quantity) => cartCubit.updateCart(
                            _cartItemEntity.cartProduct.id,
                            quantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
