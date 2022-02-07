import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/store/store.dart';
class SettingController extends GetxController{
 List<String> lang = ["English", "Arabic"];
 late RxString l ;
  late RxBool dark;
   late StoreInfo store;
  @override
  void onInit() {
    store=StoreInfo();
    UserInformation.app_theme=="light"?dark=false.obs:dark=true.obs;
    l=UserInformation.app_lang.obs;
    super.onInit();
  }
  changeLang()async{
    if(l.value=="ar"){
     await store.save("lang","en");
     l ("English");

     const _newLocale =  Locale('en');
     Get.updateLocale(_newLocale);
                        
    }else{
      await store.save("lang","ar");
      l ("Arabic");
      const _newLocale =  Locale("ar");
      print("to arabic");
      Get.updateLocale(_newLocale);

    }
  }
  changeTheme()async{
    if(dark.value){
     await store.save("theme","light");
     dark(false);
      Get.changeTheme(ThemeData.light());
    }else{
      await store.save("theme","dark");
      dark(true);
      Get.changeTheme(ThemeData.dark());
    
    }
  }
}