import 'package:get/get.dart';
import 'package:medicine/modules/edit/edit_controller.dart';

class EditBinding implements Bindings {
 
  @override
  void dependencies() {
    Get.put(EditController());
 }
  
}
