import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/data/utility/url.dart';
import 'package:get/get.dart';

class CreateProductReviewController extends GetxController {
  bool _CreateProductReviewInProgress = false;
  String _message = '';

  bool get CreateProductReviewInProgress => _CreateProductReviewInProgress;

  String get message => _message;

  Future<bool> CreateProductReview( String description,int productId, int rating) async {
    _CreateProductReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.CreateProductReview, {
      "description":description,
      "product_id":productId,
      "rating":rating,
    });
    _CreateProductReviewInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Product Review  failed! Try again';
      return false;
    }
  }
}