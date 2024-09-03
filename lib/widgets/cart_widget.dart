import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/models/item_model.dart';

class CartWidget extends StatelessWidget {
  final VoidCallback? cancel;
  final VoidCallback? onTap;
  final ItemModel item;
   const CartWidget({
    required this.item,
    this.cancel,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
                        onTap: onTap,
                        leading: SizedBox(
                          height: 64.69.h,
                          width: 70.43.w,
                          child: Image.asset(
                            item.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                        //isThreeLine: true,
                        contentPadding: EdgeInsets.only(right: 1.w),
                        title: Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                          style: semiBoldTextStyle(
                              fontSize: 16.sp,
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "\$${item.price}",
                          overflow: TextOverflow.ellipsis,
                          style: mediumTextStyle(
                              fontSize: 14.sp,
                              color: ColorManager.black,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          onPressed: cancel,
                          icon: const Icon(Icons.cancel_outlined),
                        ),
                      );
  }
}
