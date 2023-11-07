import 'package:ecommerce/presentation/state_holders/WishListController.dart';
import 'package:ecommerce/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:ecommerce/presentation/ui/widget/wish_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListController>().getCartList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backtoHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Wishlist',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: GetBuilder<WishListController>(
            builder: (wishLisController) {
              if (wishLisController.getWishListInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                    itemCount: wishLisController.wishListModel.data?.length ?? 0,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: WishProductCard(wishData: wishLisController.wishListModel.data![index] ,
                        ),
                      );
                    }),
              );
            }
        ),
        ),
    );
  }
}

