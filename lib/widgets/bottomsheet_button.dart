import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/models/item_model.dart';
import 'package:nectar/ui/product%20details/product_details.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.widget,
    required this.newPrice,
  });

  final ProductDetailsScreen widget;
  final double newPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SizedBox(
          width: 353.w,
          height: 86.h,
          child: MaterialButton(
            color: ColorManager.green,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide(color: ColorManager.green)),
            onPressed: () {
              ItemModel newData = widget.productDetails.copyWith(
                price: double.parse(newPrice.toStringAsFixed(2)),
                quantity: widget.productDetails.quantity,
              );
            },
            child: Text(
              "Add To Basket",
              textAlign: TextAlign.center,
              style: semiBoldTextStyle(
                  fontSize: 16.sp,
                  color: ColorManager.grey,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
