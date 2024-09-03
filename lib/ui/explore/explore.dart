import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/mock/mock_service.dart';
import 'package:nectar/widgets/productcard_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List _colors = [
    ColorManager.blue,
    ColorManager.deepBlue,
    ColorManager.green,
    ColorManager.lightYellow,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        toolbarHeight: 130.h,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Find Products",
              textAlign: TextAlign.center,
              style: semiBoldTextStyle(
                  fontSize: 18.sp,
                  color: ColorManager.grey2,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18.h,
            ),
            SizedBox(
              height: 53.h,
              width: 364.w,
              child: TextFormField(
                cursorColor: ColorManager.grey1,
                decoration: InputDecoration(
                    fillColor: ColorManager.grey3,
                    filled: true,
                    hintText: "Search Store",
                    hintStyle: semiBoldTextStyle(
                        fontSize: 16.sp,
                        color: ColorManager.grey1,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.r))),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorManager.white,
      body: FutureBuilder<List<ExploreItemModel>>(
          future: MockService.explore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: ColorManager.green,
              ));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.w,
                    ),
                    itemBuilder: (context, i) {
                      ExploreItemModel exploreItemModel = snapshot.data![i];
                      return ProductsCardWidget(
                        color: _colors[2],
                        exploreItemModel: exploreItemModel,
                      );
                    }),
              );
            }
          }),
    );
  }
}
