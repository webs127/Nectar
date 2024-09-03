
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';

class CheckOutHeader extends StatelessWidget {
  const CheckOutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Checkout",
              textAlign: TextAlign.center,
              style: semiBoldTextStyle(
                  fontSize: 24.sp,
                  color: ColorManager.black1,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.cancel_outlined))
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          color: ColorManager.grey1.withOpacity(.5),
        ),
      ],
    );
  }
}
