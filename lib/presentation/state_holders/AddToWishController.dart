import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/data/utility/url.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController {
  bool _addToWishInProgress = false;
  String _message = '';

  bool get addToWishInProgress => _addToWishInProgress;

  String get message => _message;

  Future<bool> addToWish(int productId) async {
    _addToWishInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.CreateWishList(productId));
    _addToWishInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Add to wishList failed! Try again';
      return false;
    }
  }
}