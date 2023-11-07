import 'package:ecommerce/presentation/state_holders/AddToCartController.dart';
import 'package:ecommerce/presentation/state_holders/CartListController.dart';
import 'package:ecommerce/presentation/state_holders/HomeSlider_controller.dart';
import 'package:ecommerce/presentation/state_holders/ProductDetailsController%20.dart';
import 'package:ecommerce/presentation/state_holders/category_controller.dart';
import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_nav_bottom_controller.dart';
import 'package:ecommerce/presentation/state_holders/newproductController.dart';
import 'package:ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:ecommerce/presentation/state_holders/popularproductController.dart';
import 'package:ecommerce/presentation/state_holders/productListController.dart';
import 'package:ecommerce/presentation/state_holders/specialproductController.dart';
import 'package:get/get.dart';

import '../presentation/state_holders/AddToWishController.dart';
import '../presentation/state_holders/CreateInvoiceController.dart';
import '../presentation/state_holders/CreateProductReviewController.dart';
import '../presentation/state_holders/WishListController.dart';
import '../presentation/state_holders/completeProfileController.dart';
import '../presentation/state_holders/readProfileController.dart';
import '../presentation/state_holders/review_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(HomeSlidersController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ProductListController());
    Get.put(CartListController());
    Get.put(AddToWishListController());
    Get.put(CreateInvoiceController());
    Get.put(WishListController());
    Get.put(ReviewListController());
    Get.put(CreateProductReviewController());
    Get.put(completeProfileController());
    Get.put(ReadProfileController());
  }
}

