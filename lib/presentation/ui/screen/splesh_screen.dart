
import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce/presentation/ui/screen/auth/complete_profiel_screen.dart';
import 'package:ecommerce/presentation/ui/screen/auth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utility/image_assets.dart';
import 'main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool hasSavedProfileData = false;
  bool hasAccessToken = false;
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }


  void goToNextScreen() async{
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(() => AuthController.isLoggedIn
          ? const MainBottomNavScreen()
          : const MainBottomNavScreen());
    });
  }
  // void goToNextScreen() async {
  //   await AuthController.getAccessToken();
  //   bool hasSavedProfileData = await AuthController.hasSavedProfileData();
  //   bool hasAccessToken = AuthController.isLoggedIn;
  //
  //   Future.delayed(const Duration(seconds: 2)).then((value) {
  //     if (hasSavedProfileData) {
  //       Get.offAll(() => const MainBottomNavScreen());
  //     } else if (hasAccessToken) {
  //       // You can fetch additional user data if needed here
  //       // For example:
  //       // Fetch user data using API call
  //       // If data is successfully fetched, navigate to CompleteProfileScreen
  //       // If the data cannot be fetched, navigate to EmailVerificationScreen
  //       Get.offAll(() => const CompleteProfileScreen());
  //     } else {
  //       Get.offAll(() => const EmailVerificationScreen());
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
                ImageAssets.craftyBayLogoSVG,
                width: 100,
              )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 16,
          ),
          const Text('Version 1.0.0'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}