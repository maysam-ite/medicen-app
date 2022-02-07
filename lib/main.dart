import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medicine/getx_bindings/Search_bindings.dart';
import 'package:medicine/getx_bindings/add_bindings.dart';
import 'package:medicine/getx_bindings/drawer_bindings.dart';
import 'package:medicine/getx_bindings/edit_bindings.dart';
import 'package:medicine/getx_bindings/home_binding.dart';
import 'package:medicine/getx_bindings/login_bindings.dart';
import 'package:medicine/getx_bindings/register_bindings.dart';
import 'package:medicine/getx_bindings/setting_bindings.dart';
import 'package:medicine/getx_bindings/splash_binding.dart';
import 'package:medicine/modules/add_products/add_page.dart';
import 'package:medicine/modules/drawer/drawer.dart';
import 'package:medicine/modules/edit/edit_page.dart';
import 'package:medicine/modules/home/home.dart';
import 'package:medicine/modules/login/login_page.dart';
import 'package:medicine/modules/register/register_page.dart';
import 'package:medicine/modules/search/search_page.dart';
import 'package:medicine/modules/setting/setting_psge.dart';
import 'package:medicine/modules/splash/splashPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        // locale:Get.locale,
        // supportedLocales: const [Locale('en'),Locale('ar')],
        // translations: MyTrans(),
        initialRoute: '/splash',
        getPages: [
          GetPage(name: '/setting', page: () => SettingPage(), binding: SettingBinding()),
          GetPage(name: '/search', page: () => SearchPage(), binding: SearchBinding()),
          GetPage(name: '/edit', page: () => EditPage(),binding: EditBinding()),
          GetPage(name: '/drawer', page: () => DrawerPage(),binding: DrawerBinding()),
          GetPage(name: '/add', page: () => AddProduct(), binding: AddBinding()),
          GetPage(name: '/login', page: () => Login(), binding: LoginBinding()),
          GetPage(name: '/splash', page: () => Splash(), binding: SplashBinding()),
          GetPage(name: '/home', page: () => Home(), binding: HomeBinding()),
          GetPage(name: '/register', page: () => Register(), binding: RegisterBinding()),
        ],
        builder: EasyLoading.init(),
        
        );
  }
}
