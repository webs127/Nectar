
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  const EmptyWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.remove_shopping_cart_outlined,
              color: ColorManager.green,
              size: 50.r,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: semiBoldTextStyle(
                  fontSize: 24.sp,
                  color: ColorManager.black1,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
  }
}
