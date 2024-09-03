import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/app/route.dart';
import 'package:nectar/core/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void start() {
    Future.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    Navigator.pushReplacementNamed(context, RouteManager.wrapper);
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: ColorManager.green),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SizedBox(
                width: 267.w,
                height: 68.h,
                child: const Image(
                    image: AssetImage("assets/images/splash_logo.png"))),
          ),
        ),
      ),
    );
  }
}
