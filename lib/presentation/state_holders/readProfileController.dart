import 'package:ecommerce/data/models/ReadProfileModel.dart';
import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/utility/url.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _completeProfileInProgress = false;
  String _message = '';
  ReadProfileModel _readProfileModel = ReadProfileModel();

  bool get emailVerificationInProgress => _completeProfileInProgress;
  ReadProfileModel get readProfileModel => _readProfileModel;
  String get message => _message;

  Future<bool> verifyReadProfile() async {
    _completeProfileInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getReadProfile);
    _completeProfileInProgress = false;
    update();
    if (response.isSuccess && response.responseJson!['data'] == null) {
     // _readProfileModel = ReadProfileModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Email verification failed! Try again';
      return false;
    }
  }
}
