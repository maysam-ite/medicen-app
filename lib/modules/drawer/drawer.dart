
import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medicine/modules/about_contact/about.dart';
import 'package:medicine/modules/about_contact/contactpage.dart';
import 'package:medicine/modules/drawer/drawer_controller.dart';

class DrawerPage extends StatelessWidget {
  LogoutController controller=Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Drawer(
      
      child: Container(
        
        width: double.infinity,
        height: double.infinity,
        child: ListView(

          children:[ Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/images/drawer.jpg",
                      width: size.width,
                      height: size.height * 0.25,
                      fit: BoxFit.fill,
                    )),
                    const SizedBox(height: 10,),
             GestureDetector(
                    child:const Card(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: ListTile(
                        leading: Icon(
                         Icons.store,
                          size: 30,
                        ),
                        title: Text("All Producte" ,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ))
                      ),
                    ),
                    onTap: () {
                     
                    },
                  ),
              const SizedBox(height: 10,),
                   GestureDetector(
                    child: const Card(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        title: Text("Setting" ,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed('/setting');
                     
                    },
                  ),
              const SizedBox(height: 10,),
              GestureDetector(
                    child:const  Card(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: ListTile(
                        leading: Icon(
                          Icons.mail,
                          size: 30,
                        ),
                        title: Text("Contact Us" ,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    onTap: () {
                      Get.to(ContacPage());
                    },
                  ),
              const SizedBox(height: 10,),
                   GestureDetector(
                    child:const Card(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: ListTile(
                        leading: Icon(
                          Icons.info,
                          size: 30,
                        ),
                        title: Text("About Us" ,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    onTap: () {
                       Get.to(About());
                     
                    },
                  ),
              const SizedBox(height: 10,),
                  GestureDetector(
                    child:const Card(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: ListTile(
                        leading: Icon(
                         Icons.store,
                          size: 30,
                        ),
                        title: Text("Log out" ,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    onTap: () {
                     clickLogout();
                    },
                  ),
            ],
          ),]
        ),
      ),
    );
  }
  clickLogout()async{
EasyLoading.show(status: 'loading ...');
    await controller.doLogout();
    if(controller.logoutstate){
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/login');
    }else{
            EasyLoading.showError(controller.message);

  }
}

}