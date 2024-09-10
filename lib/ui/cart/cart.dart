import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/ui/cart/cart_viewmodel.dart';
import 'package:nectar/widgets/cart_widget.dart';
import 'package:nectar/widgets/checkout_view.dart';
import 'package:nectar/widgets/empty_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        title: Text(
          "My Cart",
          textAlign: TextAlign.center,
          style: semiBoldTextStyle(
              fontSize: 18.sp,
              color: ColorManager.grey2,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<CartViewModel>(builder: (context, cart, __) {
        return cart.cartlist.isEmpty
            ? const EmptyWidget(
              title: "Empty Cart",
            )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                    itemBuilder: (context, i) {
                      //value = context.watch<CartViewModel>().totalPrice;
                      return CartWidget(
                        item: cart.cartlist[i],
                        cancel: () {
                          cart.removeFromCart(i);
                          log(cart.totalPrice.toString());
                        },
                      );
                    },
                    separatorBuilder: (context, i) {
                      return const Divider();
                    },
                    itemCount: cart.cartlist.length),
              );
      }),
      bottomSheet: Consumer<CartViewModel>(builder: (context, cart, __) {
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
                  checkoutview(context, cart.value.toStringAsFixed(2));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Go To Checkout",
                      textAlign: TextAlign.center,
                      style: semiBoldTextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FittedBox(
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        color: ColorManager.black.withOpacity(.2),
                        child: Text(
                          "\$${cart.value.toStringAsFixed(2)}",
                          textAlign: TextAlign.center,
                          style: semiBoldTextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }),
    );
  }
}
