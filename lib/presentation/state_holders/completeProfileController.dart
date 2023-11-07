import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/utility/url.dart';
import 'package:get/get.dart';

class completeProfileController extends GetxController {
  bool _completeProfileInProgress = false;
  dynamic _message = '';

  bool get emailVerificationInProgress => _completeProfileInProgress;

  dynamic get message => _message;

  Future<bool> verifyProfile(String cusName, String add, String cus_city, String cus_phone) async {
    _completeProfileInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.VerifyCreateProfile,{
          "cus_name": cusName,
          "cus_add": add,
          "cus_city": cus_city,
          "cus_phone": cus_phone,
        });
    _completeProfileInProgress = false;
    update();
    if (response.isSuccess) {
      _message = response.responseJson?['data'] ?? '';
      return true;
    } else {
      _message = 'Email verification failed! Try again';
      return false;
    }
  }
}
