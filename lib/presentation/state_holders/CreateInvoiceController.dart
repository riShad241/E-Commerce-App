import 'package:ecommerce/data/models/InvoiceCreateResponseModel.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/server/network_caller.dart';
import 'package:ecommerce/data/utility/url.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController {
  bool _inprogress = false;
  String _message = '';
  InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();

  InvoiceCreateData? get invoiceCreateResponseModel => _invoiceCreateResponseModel.data?.first;
  bool get inProgress => _inprogress;

  String get message => _message;

  Future<bool> CreateInvoice() async {
    _inprogress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice);
    _inprogress = false;
    update();
    if (response.isSuccess && response.responseJson!['msg'] == 'success') {
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.responseJson!);
      return true;
    } else {
      _message = 'Invoice failed! Try again';
      return false;
    }
  }
}