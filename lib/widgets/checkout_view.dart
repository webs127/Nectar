import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/widgets/chackout_tile.dart';
import 'package:nectar/widgets/checkout_header.dart';

Future<dynamic> checkoutview(BuildContext context, String totalPrice) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.only(left: 16.0.w, top: 30.h, right: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
              color: ColorManager.white,
            ),
            width: 414.w,
            //height: (896 / 2).h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CheckOutHeader(),
                  SizedBox(
                    height: 15.h,
                  ),
                  CheckOutTile(
                      title: "Delivery",
                      subtitle: "Select Method",
                      onTap: () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  CheckOutTile(
                      title: "Payment",
                      subtitle: "Select Method",
                      onTap: () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  CheckOutTile(
                      title: "Promo Code",
                      subtitle: "Pick Discount",
                      onTap: () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  CheckOutTile(
                      title: "Total Cost", subtitle: totalPrice, onTap: () {}),
                  SizedBox(
                    height: 25.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "By placing an order you agree to our \nTerms and Conditions",
                      style: semiBoldTextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.grey1,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  SizedBox(
                    width: 364.w,
                    height: 64.h,
                    child: MaterialButton(
                      color: ColorManager.green,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(color: ColorManager.green)),
                      onPressed: () {
                        //Navigator.pushNamed(context, RouteManager.signin);
                      },
                      child: Text(
                        "Place Order",
                        textAlign: TextAlign.center,
                        style: semiBoldTextStyle(
                            fontSize: 16.sp,
                            color: ColorManager.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
