import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/service/service_locator.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final String? productId;
  const HeartButton({required this.onTap, this.productId, super.key});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  final _wishlistCubit = getIt<WishListCubit>();
  late bool isInWishlist;

  @override
  void initState() {
    super.initState();
    isInWishlist =
        _wishlistCubit.allWishList.any((item) => item.id == widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListStates>(
      listener: (context, state) {
        if (state is AddProductToWishListLoading ||
            state is DeleteProductFromWishListListLoading) {
          UIUtils.showLoading(context);
        } else if (state is AddProductToWishListError ||
            state is GetUserWishListError) {
          UIUtils.hideLoading(context);
          final msg = (state is AddProductToWishListError)
              ? state.errorMessage
              : (state as GetUserWishListError).errorMessage;
          UIUtils.showMessage(msg);
        } else if (state is DeleteProductFromWishListError) {
          UIUtils.showMessage(state.errorMessage);
        } else if (state is AddProductToWishListSuccess) {
          UIUtils.hideLoading(context);
          UIUtils.showMessage("Item saved successfully to Wishlist");
          isInWishlist =
              state.updatedWishlist.any((item) => item.id == widget.productId);
        } else if (state is DeleteProductFromWishListSuccess) {
          UIUtils.hideLoading(context);
          UIUtils.showMessage("Item Removed Successfully from Wishlist");
          isInWishlist =
              state.updatedWishlist.any((item) => item.id == widget.productId);
        }
      },
      builder: (context, state) {
        return InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: () {
            if (widget.productId != null) {
              if (!isInWishlist) {
                _wishlistCubit.addProductToWishlist(widget.productId!);
              } else {
                _wishlistCubit.deleteProductFromWishlist(widget.productId!);
              }
              widget.onTap?.call();
            }
          },
          child: Material(
            color: ColorManager.white,
            elevation: 5,
            shape: const StadiumBorder(),
            shadowColor: ColorManager.black,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ImageIcon(
                AssetImage(
                  isInWishlist ? IconsAssets.clickedHeart : IconsAssets.heart,
                ),
                color: ColorManager.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
