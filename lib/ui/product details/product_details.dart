import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/mock/mock_service.dart';
import 'package:nectar/models/item_model.dart';
import 'package:nectar/ui/cart/cart_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ItemModel productDetails;
  const ProductDetailsScreen(
      {required this.productDetails, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool collapse = true;
  double newPrice = 0;

  void isCollapsed() {
    setState(() {
      collapse = !collapse;
    });
  }

  @override
  build(BuildContext context) {
    return Hero(
      tag: "two",
      transitionOnUserGestures: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.grey3,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            RotatedBox(
              quarterTurns: 3,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app_outlined)),
            )
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: ColorManager.grey3,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r),
                      )),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 340.h,
                    child: Center(
                      child: SizedBox(
                          width: 329.w,
                          height: 199.h,
                          child: Image(
                              image:
                                  AssetImage(widget.productDetails.imageUrl),
                                  fit: BoxFit.fill
                                  ),
                                  
                                  ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productDetails.name,
                                textAlign: TextAlign.center,
                                style: semiBoldTextStyle(
                                    fontSize: 24.sp,
                                    color: ColorManager.black1,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.productDetails.weight,
                                textAlign: TextAlign.center,
                                style: semiBoldTextStyle(
                                    fontSize: 16.sp,
                                    color: ColorManager.grey1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.tag_faces_outlined))
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Consumer<MockService>(builder: (context, value, __) {
                        newPrice = widget.productDetails.price;
                        newPrice = widget.productDetails.price *
                            widget.productDetails.quantity;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: widget.productDetails.quantity ==
                                            1
                                        ? () {}
                                        : () {
                                            setState(() {
                                              --widget.productDetails.quantity;
                                            });
                                          },
                                    icon: Icon(
                                      Icons.minimize_outlined,
                                      color: widget.productDetails.quantity == 1
                                          ? ColorManager.black
                                          : ColorManager.green,
                                    )),
                                Container(
                                  width: 46.w,
                                  height: 46.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: ColorManager.white,
                                      border: Border.all(
                                          color: ColorManager.black
                                              .withOpacity(.5))),
                                  child: Center(
                                    child: Text(
                                      widget.productDetails.quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: semiBoldTextStyle(
                                          fontSize: 18.sp,
                                          color: ColorManager.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        ++widget.productDetails.quantity;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: ColorManager.green,
                                    ))
                              ],
                            ),
                            Text(
                              "\$${newPrice.toStringAsFixed(2)}",
                              textAlign: TextAlign.center,
                              style: semiBoldTextStyle(
                                  fontSize: 24.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      }),
                      SizedBox(
                        height: 30.h,
                      ),
                      Divider(
                        color: ColorManager.grey2.withOpacity(.7),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Details",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 24.sp,
                                color: ColorManager.black1,
                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {
                                isCollapsed();
                              },
                              icon: RotatedBox(
                                quarterTurns: collapse ? 3 : 1,
                                child: Icon(collapse
                                    ? Icons.arrow_back_ios
                                    : Icons.arrow_back_ios),
                              )),
                        ],
                      ),
                      Text(
                        "Apples are nutrituous. Apples maybe good for weight loss. Apples maybe good for your heart as part of a Healful and varied fruit.",
                        maxLines: collapse ? 2 : 10,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: semiBoldTextStyle(
                            fontSize: 15.sp,
                            color: ColorManager.black1,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Divider(
                        color: ColorManager.grey2.withOpacity(.7),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nutritions",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 24.sp,
                                color: ColorManager.black1,
                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_right_alt_outlined)),
                        ],
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Divider(
                        color: ColorManager.grey2.withOpacity(.7),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 24.sp,
                                color: ColorManager.black1,
                                fontWeight: FontWeight.w600),
                          ),
                          
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_right_alt_outlined)),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Consumer<CartViewModel>(
        builder: (context, cart, __) {
          return SizedBox(
              width: 353.w,
              height: 86.h,
              child: MaterialButton(
                color: ColorManager.green,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(color: ColorManager.green)),
                onPressed: () {
                  ItemModel updatedItem = widget.productDetails.copyWith(
                    price: double.parse(newPrice.toStringAsFixed(2)),
                    quantity: widget.productDetails.quantity,
                  );
                //  CartWidget cartWidget = CartWidget(
                //   item: updatedItem,
                //   cancel: () {
                //     log("object");
                //     cart.removeFromCart(updatedItem);
                //   },
                //   );
                //   print(updatedItem);
                  cart.addToCart(updatedItem);
                },
                child: Text(
                  "Add To Basket",
                  textAlign: TextAlign.center,
                  style: semiBoldTextStyle(
                      fontSize: 16.sp,
                      color: ColorManager.grey,
                      fontWeight: FontWeight.bold),
                ),
              ));
        }
      ),
    ),
      ),
    );
  }
}
