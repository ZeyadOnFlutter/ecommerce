import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_quantity_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_quantity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
  final int initialValue;
  final void Function(int) onIncrement;
  final void Function(int) onDecrement;

  const ProductCounter({
    required this.onIncrement,
    required this.onDecrement,
    required this.initialValue,
  });

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  Widget build(BuildContext context) {
    int counter = widget.initialValue;
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (counter == 1) return;
              counter--;
              widget.onDecrement(counter);
            },
            child: Icon(
              Icons.remove_circle_outline,
              size: 20.w,
              color: ColorManager.white,
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          BlocBuilder<ProductQuantityCubit, ProductQuantityState>(
            builder: (context, state) {
              return Text(
                '$counter',
                style: getMediumStyle(color: ColorManager.white)
                    .copyWith(fontSize: 18.sp),
              );
            },
          ),
          SizedBox(
            width: 18.w,
          ),
          InkWell(
            onTap: () {
              counter++;
              widget.onIncrement(counter);
            },
            child: Icon(
              Icons.add_circle_outline,
              color: ColorManager.white,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
