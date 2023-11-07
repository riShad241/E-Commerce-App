import 'package:ecommerce/data/models/ProfileData.dart';
import 'package:ecommerce/presentation/state_holders/readProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utility/image_assets.dart';

class ReadProfile extends StatefulWidget {
  const ReadProfile({Key? key}) : super(key: key);

  @override
  State<ReadProfile> createState() => _ReadProfileState();
}

class _ReadProfileState extends State<ReadProfile> {


  final TextEditingController _Namecontroller = TextEditingController();
  final TextEditingController _Mobilecontroller = TextEditingController();
  final TextEditingController _Citycontroller = TextEditingController();
  final TextEditingController _ShoppingAddresscontroller = TextEditingController();

  late ReadProfileController _readProfileController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _readProfileController = Get.find<ReadProfileController>();
      _readProfileController.verifyReadProfile().then((success) {
        if(success){
          ProfileData? profiledata = _readProfileController.readProfileModel.data;
          _Namecontroller.text = profiledata?.cusName ?? '';
          _Mobilecontroller.text = profiledata?.cusPhone ?? '';
          _Citycontroller.text = profiledata?.cusCity ?? '';
          _ShoppingAddresscontroller.text = profiledata?.cusAdd ?? '';
        }
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:Column(
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('Get started with us by share your details',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.grey)),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (String? text) {
                        if (text?.isEmpty ?? true) {
                          return 'Enter your First Name';
                        }
                        return null;
                      },
                      controller: _Namecontroller,
                      decoration: const InputDecoration(hintText: 'First name'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (String? text) {
                        if (text?.isEmpty ?? true) {
                          return 'Enter your Mobile Number';
                        }
                        return null;
                      },
                      controller: _Mobilecontroller,
                      decoration: const InputDecoration(hintText: 'Mobile'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (String? text) {
                        if (text?.isEmpty ?? true) {
                          return 'Enter your City Name';
                        }
                        return null;
                      },
                      controller: _Citycontroller,
                      decoration: const InputDecoration(hintText: 'City'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (String? text) {
                        if (text?.isEmpty ?? true) {
                          return 'Enter your Address';
                        }
                        return null;
                      },
                      controller: _ShoppingAddresscontroller,
                      maxLines: 3,
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
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
