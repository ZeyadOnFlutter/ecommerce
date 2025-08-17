import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/core/widgets/product_counter.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_quantity_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_quantity_state.dart';
import 'package:ecommerce/features/products/presentation/cubit/specific_product_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/specific_product_states.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_description.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_label.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_rating.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _productQuantityCubit = getIt<ProductQuantityCubit>();
  final _cartCubit = getIt<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        _productQuantityCubit.onReset();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product Details',
            style: getMediumStyle(color: ColorManager.appBarTitle)
                .copyWith(fontSize: 20.sp),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage(IconsAssets.search),
                color: ColorManager.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        body: BlocBuilder<SpecificProductCubit, SpecificProductStates>(
          builder: (context, specificproductstate) {
            if (specificproductstate is SpecificProductLoading) {
              return const LoadingIndicator();
            } else if (specificproductstate is SpecificProductError) {
              return ErrorIndicator(specificproductstate.errorMessage);
            } else if (specificproductstate is SpecificProductSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                    end: 16.w,
                    bottom: 50.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductSlider(
                        items: specificproductstate.specificProduct.images
                            .map((imageUrl) {
                          return ProductImage(
                            imageUrl: imageUrl,
                            productId: specificproductstate.specificProduct.id,
                          );
                        }).toList(),
                        initialIndex: 0,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      ProductLabel(
                        name: specificproductstate.specificProduct.title,
                        price:
                            'EGP ${specificproductstate.specificProduct.priceAfterDiscount ?? specificproductstate.specificProduct.price}',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ProductRating(
                              buyers:
                                  '${specificproductstate.specificProduct.sold}',
                              rating:
                                  '${specificproductstate.specificProduct.ratingsAverage} (${specificproductstate.specificProduct.ratingsQuantity})',
                            ),
                          ),
                          ProductCounter(
                            initialValue:
                                _productQuantityCubit.state.productQuantity,
                            onIncrement: _productQuantityCubit.onIncrement,
                            onDecrement: _productQuantityCubit.onDecrement,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ProductDescription(
                        description:
                            specificproductstate.specificProduct.description,
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total price',
                                style: getMediumStyle(
                                  color: ColorManager.primary.withOpacity(.6),
                                ).copyWith(fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              BlocBuilder<ProductQuantityCubit,
                                  ProductQuantityState>(
                                builder: (context, productstate) {
                                  return Text(
                                    'EGP ${(specificproductstate.specificProduct.priceAfterDiscount ?? specificproductstate.specificProduct.price) * _productQuantityCubit.state.productQuantity}',
                                    style: getMediumStyle(
                                      color: ColorManager.appBarTitle,
                                    ).copyWith(fontSize: 18.sp),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 33.w,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              label: 'Add to cart',
                              onTap: () {
                                _cartCubit.addToCart(
                                  specificproductstate.specificProduct.id,
                                );
                              },
                              prefixIcon: const Icon(
                                Icons.add_shopping_cart_outlined,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
