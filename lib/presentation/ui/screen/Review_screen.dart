import 'package:ecommerce/data/models/ReviewData.dart';
import 'package:ecommerce/presentation/model/review_model.dart';
import 'package:ecommerce/presentation/state_holders/review_controller.dart';
import 'package:ecommerce/presentation/ui/screen/Create_review.dart';
import 'package:ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Review_screen extends StatefulWidget {
  const Review_screen({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  State<Review_screen> createState() => _Review_screenState();
}

class _Review_screenState extends State<Review_screen> {
  int review = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewListController>().getReviewList(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black54,),
        title: Text(
          'Review', style: TextStyle(fontSize: 18, color: Colors.black54),),
      ),
      body: GetBuilder<ReviewListController>(
          builder: (reviewListController) {
            if (reviewListController.getReviewListInProgress) {
              return const Center(child: CircularProgressIndicator(),);
            }
            return Column(
              children: [
                SizedBox(
                    height: 700,
                    child:
                    ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: reviewListController.reviewListModel.data
                            ?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.person),
                            title: Text('${reviewListController.reviewListModel
                                .data![index].profile!.cusName}'),
                            subtitle: Text('${reviewListController
                                .reviewListModel.data![index].description}'),
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 8,
                      );
                    }
                    )),


                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Reviews', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black54
                          ),),
                          SizedBox(height: 4,),
                          Text('(${reviewListController.reviewListModel.data?.length})', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.primaryColor
                          ),),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(Create_review(reviewData: reviewListController.reviewListModel.data!.first,));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )
                        ),
                        child: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
