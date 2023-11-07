import 'package:ecommerce/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/completeProfileController.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _lastNamecontroller = TextEditingController();
  final TextEditingController _mobilecontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _shoppingAddresscontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      ImageAssets.craftyBayLogoSVG,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Complete Profile',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Get started with us by share your details',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (String? text){
                      if(text?.isEmpty ?? true){
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                    controller: _firstNamecontroller,
                    decoration: const InputDecoration(hintText: 'First name'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (String? text){
                      if(text?.isEmpty ?? true){
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                    controller: _lastNamecontroller,
                    decoration: const InputDecoration(hintText: 'Last name'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (String? text){
                      if(text?.isEmpty ?? true){
                        return 'Enter your Mobile Number';
                      }
                      return null;
                    },
                    controller: _mobilecontroller,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (String? text){
                      if(text?.isEmpty ?? true){
                        return 'Enter your City Name';
                      }
                      return null;
                    },
                    controller: _citycontroller,
                    decoration: const InputDecoration(hintText: 'City'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    validator: (String? text){
                      if(text?.isEmpty ?? true){
                        return 'Enter your Address';
                      }
                      return null;
                    },
                    controller: _shoppingAddresscontroller,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Shipping address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<completeProfileController>(
                      builder: (controller) {
                        if(controller.emailVerificationInProgress){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return ElevatedButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                              verifyProfile(controller);
                            }
                          },
                          child: const Text('Complete'),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> verifyProfile(completeProfileController controller)async{
    final response =
        await controller.verifyProfile(_firstNamecontroller.text + _lastNamecontroller.text,
            _shoppingAddresscontroller.text.trim(),
            _citycontroller.text.trim(),
            _mobilecontroller.text.trim());
    if(response){
      Get.to(()=> const MainBottomNavScreen());
    }else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Complete profile failed! Try again'),
          ),
        );
      }
    }
  }
}
