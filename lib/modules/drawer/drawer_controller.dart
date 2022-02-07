
import 'package:get/get.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/modules/drawer/drawer_service.dart';

class LogoutController extends GetxController{
  late LogoutService service;
  late String message;
  late bool logoutstate;
   @override
  void onInit() async {
    
    message = '';
    service = LogoutService();
    logoutstate = false;
    super.onInit();
  }
doLogout() async{
  logoutstate = await service.logout(UserInformation.user_token);
  
  message=service.message;
}
}