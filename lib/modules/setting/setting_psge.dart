import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/modules/setting/setting_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
 SettingController controller=Get.find();
 
  @override
  Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Setting"),
              ),
              body: Column(
                children: [
                  Obx((){
                    return Container(
                    child: SwitchListTile(
                        title: Text("Dark Mode"),
                        value: controller.dark.value,
                        onChanged: (bool) {
                         controller.changeTheme();
                        }),
                  );
                  }),
                  
                  Container(
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        items: controller.lang
                            .map((e) =>
                                DropdownMenuItem(child: Text("$e"), value: e))
                            .toList(),
                        onChanged: (val) async {
                        await controller.changeLang();
                        },
                        hint:const Text(
                          "Select Language",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      )),
                ],
              ));
    
  }
}
