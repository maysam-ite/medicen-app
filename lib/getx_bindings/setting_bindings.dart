import 'package:get/get.dart';
import 'package:medicine/modules/add_products/add_controller.dart';
import 'package:medicine/modules/setting/setting_controller.dart';

class SettingBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SettingController());
  }
  
}