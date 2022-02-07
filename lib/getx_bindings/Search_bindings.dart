import 'package:get/get.dart';
import 'package:medicine/modules/search/search_controller.dart';

class SearchBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchContoller());
  }
  
}