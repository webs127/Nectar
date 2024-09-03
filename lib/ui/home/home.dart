import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/mock/mock_service.dart';
import 'package:nectar/ui/product%20details/product_details.dart';
import 'package:nectar/widgets/item_cardwidget.dart';
import 'package:nectar/widgets/mini_cardwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  void onChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        toolbarHeight: 170.h,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.w,
              height: 34.h,
             child: const Image(
                image: AssetImage("assets/images/carrot.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Dhaka, Banassre",
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
      body: FutureBuilder<Map<String, dynamic>>(
          future: MockService.getAllFruits(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: ColorManager.green,
              ));
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exclusive Offer",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 24.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See all",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 16.sp,
                                color: ColorManager.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          height: 200.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!["exclusive offer"].length,
                            itemBuilder: (constext, index) {
                              return Hero(
                                tag: index.toString(),
                                transitionOnUserGestures: true,
                                child: ItemCardWidget(
                                    name: snapshot
                                        .data!["exclusive offer"][index].name,
                                    weight: snapshot
                                        .data!["exclusive offer"][index].weight,
                                    quantity: snapshot
                                        .data!["exclusive offer"][index]
                                        .quantity,
                                    imageUrl: snapshot
                                        .data!["exclusive offer"][index]
                                        .imageUrl,
                                    price: snapshot
                                        .data!["exclusive offer"][index].price,
                                    callback: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  ProductDetailsScreen(
                                                    productDetails: snapshot
                                                                .data![
                                                            "exclusive offer"]
                                                        [index],
                                                  )));
                                    }),
                              );
                            },
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Selling",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 24.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See all",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 16.sp,
                                color: ColorManager.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          height: 200.h,
                          //width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            //itemExtent: 0,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!["best selling"].length,
                            itemBuilder: (constext, index) {
                              return ItemCardWidget(
                                  name: snapshot
                                      .data!["best selling"][index].name,
                                  weight: snapshot
                                      .data!["best selling"][index].weight,
                                  quantity: snapshot
                                      .data!["best selling"][index].quantity,
                                  imageUrl: snapshot
                                      .data!["best selling"][index].imageUrl,
                                  price: snapshot
                                      .data!["best selling"][index].price,
                                  callback: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ProductDetailsScreen(
                                                  productDetails: snapshot
                                                          .data![
                                                      "best selling"][index],
                                                )));
                                  });
                            },
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Groceries",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 24.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See all",
                            textAlign: TextAlign.center,
                            style: semiBoldTextStyle(
                                fontSize: 16.sp,
                                color: ColorManager.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          height: 110.h,
                          //width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            //itemExtent: 0,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (constext, index) {
                              return const MiniCardWidget();
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          height: 200.h,
                          //width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            //itemExtent: 0,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (constext, index) {
                              return ItemCardWidget(
                                name: snapshot
                                    .data!["exclusive offer"][index].name,
                                weight: snapshot
                                    .data!["exclusive offer"][index].weight,
                                quantity: snapshot
                                    .data!["exclusive offer"][index].quantity,
                                imageUrl: snapshot
                                    .data!["exclusive offer"][index].imageUrl,
                                price: snapshot
                                    .data!["exclusive offer"][index].price,
                                callback: () {},
                              );
                            },
                          )),
                    ],
                  ),
                )),
              );
            }
          }),
    );
  }
}
