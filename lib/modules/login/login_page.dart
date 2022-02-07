import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medicine/component/textfield_custom.dart';
import 'package:medicine/modules/login/login_controller.dart';

import 'login_controller.dart';

class Login extends StatelessWidget {
  LoginController controller = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/registerpage.png',
                ),
                fit: BoxFit.fill,
              )),
              padding: const EdgeInsets.all(10),
              child: ListView(
                children:[ Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 60,
                    ),
                    const Text("Welcom Back",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFieldCustom(
                      icon: Icons.email,
                      hint: 'Your Email',
                      changefunction: (val){
                        
                 
                        _.email=val ;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldCustom(
                      icon: Icons.password,
                      hint: "Your Password",
                      issecur: _.passwordsecrity,
                      changefunction: (val){
                        _.password=val;
                      },
                      suffixfunction: () {
                        _.c();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: ()  {
                        onClicksignin();
                      },
                      child: const Text(
                        "sing in",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.teal),
                      ),
                    ),
                   const  SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("if you haven't an account! "),
                          TextButton(
                            onPressed: () {onclicktoregister();},
                            child: const Text(
                              "Click Here ",
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),]
              ),
            ),
          ),
        );
      },
    );
  }
   void onclicktoregister(){
     Get.toNamed('/register');
   }
   void onClicksignin() async{
    EasyLoading.show(status: 'loading ...');
    await controller.loginclick();
    if(controller.loginstate){
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/home');
    }else{
      EasyLoading.showError(controller.message,duration:const  Duration(seconds: 2),dismissOnTap: true);
    }
   }
}
