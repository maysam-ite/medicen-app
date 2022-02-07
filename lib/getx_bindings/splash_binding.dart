import 'package:get/get.dart';
import 'package:medicine/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
  
}