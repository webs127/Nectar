import 'package:flutter/material.dart';
import 'package:nectar/ui/account/account.dart';
import 'package:nectar/ui/cart/cart.dart';
import 'package:nectar/ui/explore/explore.dart';
import 'package:nectar/ui/favourite/favourite.dart';
import 'package:nectar/ui/home/home.dart';
import 'package:nectar/ui/landing/landing.dart';
import 'package:nectar/ui/onboarding/onboarding.dart';
import 'package:nectar/ui/signin/signin.dart';
import 'package:nectar/ui/splash/splash.dart';
import 'package:nectar/ui/wrapper/wrapper.dart';

class RouteManager {
  static const String splash = "/";
  static const String wrapper = "/wrapper";
  static const String onboarding = "/onboarding";
  static const String signin = "/signin";
  static const String home = "/home";
  static const String landing = "/landing";
  static const String explore = "/explore";
  static const String cart = "/cart";
  static const String favourite = "/favourite";
  static const String account = "/account";
  static const String productDetails = "/product_details";
}

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RouteManager.signin:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteManager.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteManager.landing:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case RouteManager.explore:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case RouteManager.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case RouteManager.favourite:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      case RouteManager.account:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case RouteManager.wrapper:
        return MaterialPageRoute(builder: (_) => const NectarWrapper());
      // case RouteManager.productDetails:
      // final args = settings.arguments as ItemModel;
      //   return MaterialPageRoute(builder: (_) => ProductDetailsScreen(productDetails: args));
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}

