import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/ui/wrapper/wrapper_viewmodel.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 374.h,
              child: const Image(
                image: AssetImage("assets/images/signin_image.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 49.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Get your groceries\nwith nectar",
                      textAlign: TextAlign.left,
                      style: semiBoldTextStyle(
                          fontSize: 24.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 364.w,
                    height: 41.h,
                    color: ColorManager.black,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Or connect with social media",
                    textAlign: TextAlign.center,
                    style: semiBoldTextStyle(
                        fontSize: 14.sp,
                        color: ColorManager.grey1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  MaterialButton(
                    minWidth: 364.w,
                    height: 67.h,
                    color: ColorManager.blue,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: BorderSide(color: ColorManager.blue)),
                    onPressed: () {
                      //Navigator.pushNamed(context, RouteManager.signin);
                    },
                    child: Text(
                      "Contine with Google",
                      textAlign: TextAlign.center,
                      style: semiBoldTextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MaterialButton(
                    minWidth: 364.w,
                    height: 67.h,
                    color: ColorManager.deepBlue,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: BorderSide(color: ColorManager.deepBlue)),
                    onPressed: () {
                      context.read<WrapperViewmodel>().onChange();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Contine with Facebook",
                      textAlign: TextAlign.center,
                      style: semiBoldTextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
