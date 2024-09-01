import 'package:ecommerceapplication/features/authentication/controllers/network_Controller/network_controller.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkHelper());
  }
}
