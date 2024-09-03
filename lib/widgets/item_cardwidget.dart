import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';

class ItemCardWidget extends StatelessWidget {
  final VoidCallback? callback;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String weight;
  const ItemCardWidget({
    this.callback,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.only(right: 15.18.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            //margin: EdgeInsets.only(right: 15.w),
            width: 173.w,
            //height: 248.h,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: ColorManager.grey1.withOpacity(.5))),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  width: 103.w,
                  height: 63.h,
                  child: Image(image: AssetImage(imageUrl)),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 103.w,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: semiBoldTextStyle(
                              fontSize: 16.sp,
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        weight,
                        textAlign: TextAlign.center,
                        style: semiBoldTextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.grey1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price",
                      textAlign: TextAlign.center,
                      style: semiBoldTextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {},
                      radius: 15.r,
                      borderRadius: BorderRadius.circular(15.r),
                      child: Container(
                        width: 46.w,
                        height: 46.w,
                        decoration: BoxDecoration(
                            color: ColorManager.green,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Icon(
                          Icons.add,
                          color: ColorManager.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
