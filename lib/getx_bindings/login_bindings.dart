import 'package:get/get.dart';
import 'package:medicine/modules/login/login_controller.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
  
}