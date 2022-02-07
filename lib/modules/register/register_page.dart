import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medicine/component/textfield_custom.dart';
import 'package:medicine/modules/register/register_controller.dart';
class Register extends StatelessWidget {
  RegisterController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/registerpage.png"), fit: BoxFit.fill)),
          padding:const EdgeInsets.all(10),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Create New Account",
                    style: TextStyle(fontSize: 25, color: Colors.teal),
                  ),
                  TextFieldCustom(
                    hint: "Full Name",
                    icon: Icons.person,
                    changefunction: (val) {
                      controller.fullname = val;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldCustom(
                    hint: "Your Email",
                    icon: Icons.email,
                    changefunction: (val) {
                      controller.email = val;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx((){
                    return TextFieldCustom(
                    hint: "Password",
                    icon: Icons.password,
                    changefunction: (val) {
                      controller.password = val;
                    },
                    issecur: controller.passwordsecrity.value,
                    suffixfunction: (){controller.changepasswordsecrity();},
                  );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx((){
                    return TextFieldCustom(
                    hint: "Confirm Password",
                    icon: Icons.password,
                    changefunction: (val) {
                      controller.con_password = val;
                    },
                    issecur: controller.confpasswordsecrity.value,
                    suffixfunction: (){controller.changeconfpasswordsecrity();},
                  
                  );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.teal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal[600],
                          borderRadius: BorderRadius.circular(50)),
                      alignment: Alignment.center,
                      width: 150,
                      height: 50,
                      child: const Text("Register Here",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    onTap: (){
                      onClickregister();
                    },
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
  void onClickregister() async{
    EasyLoading.show(status: 'loading ...');
    await controller.registerclick();
    if(controller.registerstate){
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/home');
    }else{
      EasyLoading.showError(controller.message,duration:const  Duration(seconds: 5),dismissOnTap: true);
    }
   }
}
