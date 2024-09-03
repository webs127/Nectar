import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/ui/account/account.dart';
import 'package:nectar/ui/cart/cart.dart';
import 'package:nectar/ui/explore/explore.dart';
import 'package:nectar/ui/favourite/favourite.dart';
import 'package:nectar/ui/home/home.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentIndex = 0;

  void onChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  final List _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: ColorManager.white,
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onChanged,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: ColorManager.black1,
          selectedItemColor: ColorManager.green,
          selectedLabelStyle: semiBoldTextStyle(
              fontSize: 12.sp,
              color: ColorManager.black1,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: semiBoldTextStyle(
              fontSize: 12.sp,
              color: ColorManager.black1,
              fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
                label: "Shop",
                icon: ImageIcon(AssetImage("assets/images/home.png"))),
            BottomNavigationBarItem(
                label: "Explore",
                icon: ImageIcon(AssetImage("assets/images/explore.png"))),
            BottomNavigationBarItem(
                label: "Cart",
                icon: ImageIcon(AssetImage("assets/images/cart.png"))),
            BottomNavigationBarItem(
                label: "Favourite",
                icon: ImageIcon(AssetImage("assets/images/love.png"))),
            BottomNavigationBarItem(
                label: "Account",
                icon: ImageIcon(AssetImage("assets/images/account.png"))),
          ]),
    );
  }
}
