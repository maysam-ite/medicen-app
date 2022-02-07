import 'package:get/get.dart';
import 'package:medicine/modules/delete/delete_controller.dart';


class DeleteBinding implements Bindings {
  var id;
  DeleteBinding({
    required this.id,
  });
  
  @override
  void dependencies() {
    Get.lazyPut<DeleteController>(() => DeleteController(id:id));
 }
  
}
