
import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80,),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                  ),
                ),
                const SizedBox(height: 16,),
                Text('Welcome back', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                ),),
                const SizedBox(height: 4,),
                Text(
                    'Please enter your email address',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey
                    )
                ),
                const SizedBox(height: 24,),
                TextFormField(
                  validator: (String? text){
                    if(text?.isEmpty ?? true){
                      return 'Enter your Email address';
                    }else if(text!.isEmail == false){
                      return 'Enter your valid Email address';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<EmailVerificationController>(
                      builder: (controller) {
                        if (controller.emailVerificationInProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              verifyEmail(controller);
                            }
                          },
                          child: const Text('Next'),
                        );
                      }),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
    await controller.verifyEmail(_emailController.text.trim());
    if (response) {
      Get.to(() =>  OTPVerificationScreen(email: _emailController.text.trim(),));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text(controller.message),
          ),
        );
      }
    }
  }
}