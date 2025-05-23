import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce/features/cart/presentation/widgets/total_price_and_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartCubit = getIt<CartCubit>();
  @override
  void initState() {
    super.initState();
    _cartCubit.getFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.text),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.s14.sp),
        child: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            if (state is GetFromCartLoading) {
              return const LoadingIndicator();
            } else if (state is GetFromCartError) {
              return ErrorIndicator(state.errorMessage);
            } else if (state is GetFromCartSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) => CartItem(
                        state.cartModelEntity,
                        index,
                      ),
                      itemCount: state.cartModelEntity.cartItem.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: Sizes.s12.h),
                    ),
                  ),
                  TotalPriceAndCheckoutButton(
                    totalPrice: state.cartModelEntity.totalCartPrice,
                    checkoutButtonOnTap: () {},
                  ),
                  SizedBox(height: 10.h),
                ],
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
