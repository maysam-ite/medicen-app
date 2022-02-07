
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/store/store.dart';

class SplashController extends GetxController{
  late StoreInfo store;
 @override
  void onInit() async {
    store=StoreInfo();
    await choselang();
   await chosetheme();
   await chosescreen();
    super.onInit();
  }
  choselang() async{
    var val= await store.read("lang");
    if(val !=null){
      UserInformation.app_lang=val;
      Get.updateLocale(Locale(val));
    }else{
      store.save("lang","en");
    }
  }
  chosetheme()async{
    var val= await store.read("theme");
     if(val !=null){
      UserInformation.app_theme=val;
      val=="dark"? Get.changeTheme(ThemeData.dark()): Get.changeTheme(ThemeData.light());
    }else{
      store.save("theme","light");
    }
  }
  chosescreen() async{
    String? val= await store.read("token");
    if(val !=null){
      UserInformation.user_token=val;
      Get.offAllNamed('/home');
    }else{
      Get.offAllNamed('/login');
    }

  }
}