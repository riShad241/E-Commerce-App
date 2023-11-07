import 'package:ecommerce/presentation/model/review_model.dart';
import 'package:ecommerce/presentation/state_holders/CreateProductReviewController.dart';
import 'package:ecommerce/presentation/state_holders/review_controller.dart';
import 'package:ecommerce/presentation/ui/screen/Review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/ReviewData.dart';

class Create_review extends StatefulWidget {
  const Create_review({Key? key, required this.reviewData, }) : super(key: key);
  final ReviewData reviewData;

  @override
  State<Create_review> createState() => _Create_reviewState();
}

class _Create_reviewState extends State<Create_review> {

  final TextEditingController _fstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ReviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: const Text(
          'Create Review',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _fstNameController,
                  decoration: const InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(color: Colors.grey)

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _ReviewController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      hintText: 'Write Review',
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CreateProductReviewController>(
                      builder: (createProductReviewController) {
                        if(createProductReviewController.CreateProductReviewInProgress){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return ElevatedButton(  onPressed: () async {
                            final result = await createProductReviewController
                                .CreateProductReview(
                                    _ReviewController.text,
                                widget.reviewData.productId ?? 0,
                                widget.reviewData.rating ?? 0);
                            if (result) {
                            Get.snackbar('Added to cart',
                                'This product has been added to cart list',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        }, child: Text('Submit'));
                      }
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
