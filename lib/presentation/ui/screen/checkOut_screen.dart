import 'package:ecommerce/data/models/paymentMethodModel.dart';
import 'package:ecommerce/presentation/state_holders/CreateInvoiceController.dart';
import 'package:ecommerce/presentation/ui/screen/web_viewScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool isCompleted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().CreateInvoice().then((value){
        isCompleted = value;
        if(mounted){
        setState(() {
        });
      }});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out '),
      ),
      body: GetBuilder<CreateInvoiceController>(
        builder: (controller){
          if(controller.inProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(!isCompleted){
            return const Center(child: Text('Please Complete your Profile'),);
          }
          return ListView.separated(
              itemCount: controller.invoiceCreateResponseModel?.paymentMethod?.length ?? 0,
              itemBuilder: (context, index){
                final PaymentMethod paymentMethod = controller.invoiceCreateResponseModel!.paymentMethod![index];
                return ListTile(
                  leading:Image.network(paymentMethod.logo ?? '',width: 60,),
                  title:  Text(paymentMethod.name ?? ''),
                  onTap: (){
                    Get.off(WebViewScreen(paymentUrl: paymentMethod.redirectGatewayURL!));
                  },
                );
              },
              separatorBuilder: (_,__) => const Divider(),);
        },
      ),
    );
  }
}
