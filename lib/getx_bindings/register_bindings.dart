import 'package:get/get.dart';
import 'package:medicine/modules/register/register_controller.dart';

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
  
}