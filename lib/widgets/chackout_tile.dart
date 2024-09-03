
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';

class CheckOutTile extends StatelessWidget {
  final String title;
  final String subtitle;
  VoidCallback? onTap;
  CheckOutTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: semiBoldTextStyle(
                  fontSize: 18.sp,
                  color: ColorManager.grey1,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: semiBoldTextStyle(
                      fontSize: 16.sp,
                      color: ColorManager.black1,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          color: ColorManager.grey1.withOpacity(.5),
        ),
      ],
    );
  }
}
