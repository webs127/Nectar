
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';

class MiniCardWidget extends StatelessWidget {
  const MiniCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: IntrinsicWidth(
        child: Container(
          width: 248.w,
          //height: 105.h,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          margin: EdgeInsets.only(right: 15.h),
          decoration: BoxDecoration(
              color: ColorManager.lightYellow,
              borderRadius: BorderRadius.circular(25.r)),
          child: Row(
            children: [
              SizedBox(
                width: 17.h,
              ),
              Container(
                width: 72.w,
                height: 72.w,
                color: ColorManager.grey,
              ),
              SizedBox(
                width: 15.h,
              ),
              Text(
                "Pulses",
                textAlign: TextAlign.center,
                style: semiBoldTextStyle(
                    fontSize: 20.sp,
                    color: ColorManager.black1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}