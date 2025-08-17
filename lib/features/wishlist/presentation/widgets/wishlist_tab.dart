import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab();

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  final _wishlistCubit = getIt<WishListCubit>();
  @override
  void initState() {
    super.initState();
    _wishlistCubit.getUserWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.s14.w,
        vertical: Sizes.s10.h,
      ),
      child: BlocConsumer<WishListCubit, WishListStates>(
        listener: (context, state) {
          if (state is DeleteProductFromWishListListLoading) {
            UIUtils.showLoading(context);
          } else if (state is DeleteProductFromWishListError) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage(state.errorMessage);
          } else if (state is DeleteProductFromWishListSuccess) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage("Item Removed Successfully");
          }
        },
        builder: (context, state) {
          if (state is GetUserWishListLoading) {
            return const LoadingIndicator();
          } else if (state is GetUserWishListError) {
            return ErrorIndicator(state.errorMessage);
          } else {
            return _wishlistCubit.allWishList.isEmpty
                ? Center(
                    child: Text(
                      'WishList Is Empty',
                      style: getMediumStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _wishlistCubit.allWishList.length,
                    itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: Sizes.s12.h),
                      child: WishlistItem(
                        wishlistItem: _wishlistCubit.allWishList[index],
                      ),
                    ),
                  );
          }
        },
      ),
    );
  }
}
