import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/mock/mock_service.dart';
import 'package:nectar/ui/explore/explore_items.dart';

class ProductsCardWidget extends StatelessWidget {
  final Color color;
  final ExploreItemModel exploreItemModel;
  const ProductsCardWidget({
    required this.color,
    required this.exploreItemModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ExploreItemsView(
                      exploreItemModel: exploreItemModel,
                    )));
      },
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        width: 174.5.w,
        height: 189.11.h,
        decoration: BoxDecoration(
          color: color.withOpacity(.5),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 102.5.w,
              height: 68.82.h,
              // color: ColorManager.black.withOpacity(.5),
            ),
            SizedBox(
              height: 20.w,
            ),
            SizedBox(
              width: 93.w,
              child: Text(
                exploreItemModel.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: semiBoldTextStyle(
                    fontSize: 16.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
