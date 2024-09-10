import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nectar/core/color_manager.dart';
import 'package:nectar/core/textstyle_manager.dart';
import 'package:nectar/ui/cart/cart_viewmodel.dart';
import 'package:nectar/ui/favourite/favourite_viewModel.dart';
import 'package:nectar/widgets/empty_widget.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        title: Text(
          "Favourite",
          textAlign: TextAlign.center,
          style: semiBoldTextStyle(
              fontSize: 20.sp,
              color: ColorManager.grey2,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<FavouriteViewModel>(builder: (context, favourite, __) {
        return favourite.isEmpty
            ? const Center(
                child: EmptyWidget(
                  title: "No Favourite",
                ),
              )
            : ListView.separated(
                itemCount: favourite.length,
                itemBuilder: (context, i) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      ),
                    ),
                    key: Key(i.toString()),
                    child: ListTile(
                      horizontalTitleGap: 42,
                      leading: SizedBox(
                          width: 40,
                          height: 50,
                          child: Image.asset(favourite.favourite[i].imageUrl)),
                      title: Text(
                        favourite.favourite[i].name,
                        style: semiBoldTextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        favourite.favourite[i].weight,
                        style: mediumTextStyle(
                            fontSize: 14, color: ColorManager.grey1),
                      ),
                      trailing: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "\$${favourite.favourite[i].price}",
                              style: semiBoldTextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Dismissible(
                        key: Key(i.toString()), child: const Divider()),
                  );
                });
      }),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: SizedBox(
            width: 353.w,
            height: 86.h,
            child: MaterialButton(
              color: ColorManager.green,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: ColorManager.green)),
              onPressed: context.read<FavouriteViewModel>().isEmpty
                  ? () {
                      print(true);
                    }
                  : () {
                      context.read<CartViewModel>().addListToCart(
                          context.read<FavouriteViewModel>().favourite);
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add all to cart",
                    textAlign: TextAlign.center,
                    style: semiBoldTextStyle(
                        fontSize: 16.sp,
                        color: ColorManager.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
