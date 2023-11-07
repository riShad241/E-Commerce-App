import 'package:ecommerce/data/models/ReviewListModel.dart';
import 'package:ecommerce/presentation/model/review_model.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/server/network_caller.dart';
import '../../data/utility/url.dart';

class ReviewListController extends GetxController {
  bool _getReviewListInProgress = false;
  String _message = '';
  ReviewListModel _reviewListModel = ReviewListModel();

  bool get getReviewListInProgress => _getReviewListInProgress;

  String get message => _message;

  ReviewListModel get reviewListModel => _reviewListModel;


  Future<bool> getReviewList(int productId) async {
    _getReviewListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.ReviewList(productId));
    _getReviewListInProgress = false;
    if (response.isSuccess) {
      _reviewListModel = ReviewListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'get cart list failed! Try again';
      return false;
    }
  }
  // RxList<Review> reviews = <Review>[].obs;
  // void addReview(Review review){
  //   reviews.add(review);
  // }
}