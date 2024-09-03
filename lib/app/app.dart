import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/app/route.dart';
import 'package:nectar/mock/mock_service.dart';
import 'package:nectar/ui/cart/cart_viewmodel.dart';
import 'package:nectar/ui/home/home_viewmodel.dart';
import 'package:nectar/ui/wrapper/wrapper_viewmodel.dart';
import 'package:provider/provider.dart';



class MyApp extends StatelessWidget {
  const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ChangeNotifierProvider(create: (_) => MockService()),
          ChangeNotifierProvider(create: (_) => CartViewModel()),
          ChangeNotifierProvider(create: (_) => WrapperViewmodel()),
        ],
        child: const MaterialApp(
          initialRoute: RouteManager.splash,
          onGenerateRoute: Routes.getRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
