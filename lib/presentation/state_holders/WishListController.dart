import 'package:ecommerce/data/models/CartListModel.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/wishListModel.dart';
import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/data/utility/url.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _message = '';
  WishListModel _wishListModel = WishListModel();

  bool get getWishListInProgress => _getWishListInProgress;

  String get message => _message;

  WishListModel get wishListModel => _wishListModel;


  Future<bool> getCartList() async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getWishList);
    _getWishListInProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      _message = 'get cart list failed! Try again';
      return false;
    }
  }
  // Future<bool> removeFromCart(int id) async {
  //   _getWishListInProgress = true;
  //   update();
  //   final NetworkResponse response = await NetworkCaller.getRequest(Urls.removeFromCart(id));
  //   _getWishListInProgress = false;
  //   if (response.isSuccess) {
  //     _cartListModel.data?.removeWhere((element) => element.productId == id);
  //     _calculateTotalPrice();
  //     update();
  //     return true;
  //   } else {
  //     _message = 'get cart list failed! Try again';
  //     return false;
  //   }
  // }
  //
  // void changeItem(int cartId, int noOfItems) {
  //   _cartListModel.data?.firstWhere((cartData) => cartData.id == cartId).quantity = noOfItems;
  //   _calculateTotalPrice();
  // }
  //
  // void _calculateTotalPrice() {
  //   _totalPrice = 0;
  //   for (CartData data in _cartListModel.data ?? []) {
  //     _totalPrice += ((data.quantity ?? 1) *
  //         (double.tryParse(data.product?.price ?? '0') ?? 0));
  //   }
  //   update();
  // }

}