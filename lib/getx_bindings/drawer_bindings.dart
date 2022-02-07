import 'package:get/get.dart';
import 'package:medicine/modules/drawer/drawer_controller.dart';


class DrawerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoutController>(() => LogoutController());
 }
  
}
