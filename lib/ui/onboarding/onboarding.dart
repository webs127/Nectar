import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/app/route.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Image(
                image: AssetImage("assets/images/onboarding.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 354.h,
              left: 182.w,
              right: 182.w,
              child: SizedBox(
                width: 48.w,
                height: 56.h,
                child: const Image(
                  image: AssetImage("assets/images/carrot_white.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 232.h,
               left: 80.w,
              // right: 80.w,
              child: SizedBox(
                 width: 253.w,
                height: 86.h,
                child: FittedBox(
                  child: Text(
                    "Welcome\nto our store",
                    textAlign: TextAlign.center,
                    style: blackTextStyle(fontSize: 48.sp,
                    color: ColorManager.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 178.h,
               left: 60.w,
               right: 60.w,
              child: SizedBox(
                 width: 298.w,
                height: 86.h,
                child: FittedBox(
                  child: Text(
                    "Get your groceries as soon  as possible",
                    textAlign: TextAlign.center,
                    style: mediumTextStyle(fontSize: 16.sp,
                    color: ColorManager.grey),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 90.h,
               left: 30.w,
              right: 30.w,
              child: SizedBox(
                 width: 353.w,
                height: 70.h,
                child: MaterialButton(
                  color: ColorManager.green,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(color: ColorManager.green)
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteManager.signin);
                  },
                  child: Text(
                    "Get started",
                    textAlign: TextAlign.center,
                    style: semiBoldTextStyle(fontSize: 16.sp,
                    color: ColorManager.grey, fontWeight: FontWeight.bold),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
