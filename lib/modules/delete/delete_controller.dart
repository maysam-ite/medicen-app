import 'package:get/state_manager.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/modules/delete/delete_service.dart';

class DeleteController extends GetxController{
  late  DeleteService service;
  int id;
  late bool deleteState;
  DeleteController({required this.id});
  @override
  void onInit() {
  service=DeleteService();
  deleteState=false;
    super.onInit();
  }
  addProduct() async {
   
    deleteState=await service.delete(id,UserInformation.user_token);
    
  }

}