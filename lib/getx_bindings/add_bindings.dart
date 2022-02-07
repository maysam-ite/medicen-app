import 'package:get/get.dart';
import 'package:medicine/modules/add_products/add_controller.dart';

class AddBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
  
}