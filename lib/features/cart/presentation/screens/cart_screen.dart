import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
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
        child: BlocConsumer<CartCubit, CartStates>(
          listener: (context, state) {
            if (state is UpdateCartLoading || state is DeleteFromCartLoading) {
              UIUtils.showLoading(context);
            } else if (state is UpdateCartError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.errorMessage);
            } else if (state is DeleteFromCartError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.errorMessage);
            } else if (state is UpdateCartSuccess ||
                state is DeleteFromCartSuccess) {
              UIUtils.hideLoading(context);
            }
          },
          builder: (context, state) {
            if (state is GetFromCartLoading) {
              return const LoadingIndicator();
            } else if (state is GetFromCartError) {
              return ErrorIndicator(state.errorMessage);
            } else {
              return _cartCubit.cartModelEntity.cartItem.isEmpty
                  ? Center(
                      child: Text(
                        'Cart Is Empty',
                        style: getMediumStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (_, index) => CartItem(
                              _cartCubit.cartModelEntity.cartItem[index],
                              index,
                            ),
                            itemCount:
                                _cartCubit.cartModelEntity.cartItem.length,
                            separatorBuilder: (_, __) =>
                                SizedBox(height: Sizes.s12.h),
                          ),
                        ),
                        TotalPriceAndCheckoutButton(
                          totalPrice: _cartCubit.cartModelEntity.totalCartPrice,
                          checkoutButtonOnTap: () {},
                        ),
                        SizedBox(height: 10.h),
                      ],
                    );
            }
          },
        ),
      ),
    );
  }
}
