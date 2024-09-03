import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/mock/mock_service.dart';
import 'package:nectar/ui/product%20details/product_details.dart';
import 'package:nectar/widgets/item_cardwidget.dart';

class ExploreItemsView extends StatelessWidget {
  final ExploreItemModel exploreItemModel;
  const ExploreItemsView({required this.exploreItemModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorManager.white,
          title: Text(
            exploreItemModel.name,
            textAlign: TextAlign.center,
            style: semiBoldTextStyle(
                fontSize: 18.sp,
                color: ColorManager.grey2,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: GridView.builder(
              itemCount: exploreItemModel.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15.w,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 1,
                  crossAxisCount: 2),
              itemBuilder: (context, i) {
                return SizedBox(
                  height: 250.h,
                  child: ItemCardWidget(
                    name: exploreItemModel.items[i].name,
                    price: exploreItemModel.items[i].price,
                    quantity: exploreItemModel.items[i].quantity,
                    imageUrl: exploreItemModel.items[i].imageUrl,
                    weight: exploreItemModel.items[i].weight,
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                    productDetails: exploreItemModel.items[i],
                                  )));
                    },
                  ),
                );
              }),
        ));
  }
}
