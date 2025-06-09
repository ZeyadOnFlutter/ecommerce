import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/products/presentation/cubit/produc_states.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen();

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? categoryId;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _scrollController.addListener(
          () {
            if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200) {
              getIt<ProductCubit>().getProducts(6, categoryId, true);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryId = ModalRoute.of(context)!.settings.arguments as String;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        getIt<ProductCubit>().resetProducts();
      },
      child: BlocListener<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is AddToCartLoading) {
            UIUtils.showLoading(context);
          } else if (state is AddToCartError) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage(state.errorMessage);
          } else if (state is AddToCartSuccess) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage("Item Added To Cart Successfully");
          }
        },
        child: Scaffold(
          appBar: const HomeScreenAppBar(
            automaticallyImplyLeading: true,
          ),
          body: BlocBuilder<ProductCubit, ProductStates>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const LoadingIndicator();
              } else if (state is ProductError) {
                return ErrorIndicator(state.errorMessage);
              } else if (state is ProductSuccess) {
                return GridView.builder(
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (_, index) => index >= state.products.length
                      ? const LoadingIndicator()
                      : ProductItem(state.products[index]),
                  itemCount: state.products.length +
                      (getIt<ProductCubit>().hasMoreData ? 2 : 0),
                  padding: EdgeInsets.all(Insets.s16.sp),
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
}
