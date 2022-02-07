import 'package:get/get.dart';
import 'package:medicine/model/model.dart';
import 'package:medicine/modules/register/register_service.dart';

class RegisterController extends GetxController{
 
late String fullname ;
late String email ;
late String  password ;
late String con_password ;
late String message;
late RegisterService service;
 var passwordsecrity=true.obs;
  var confpasswordsecrity=true.obs;

 late bool registerstate;
@override
  void onInit() async {
    email = '';
    password = '';
    con_password='';
    fullname='';
    message = '';
    service = RegisterService();
    registerstate = false;
   // passwordsecrity=true.obs;
   // confpasswordsecrity=true.obs;
    super.onInit();
  }
  void changepasswordsecrity(){
    passwordsecrity(!(passwordsecrity.value));
    print(passwordsecrity.value);
  }
   void changeconfpasswordsecrity(){
    confpasswordsecrity(!confpasswordsecrity.value);
  }
  Future<void> registerclick() async {
    User user = User(email: email, password: password,name: fullname,confpassword: con_password);
    registerstate = await service.register(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
      mapmsg["email"]==null?null:message+="${mapmsg["email"][0]}\n";
      mapmsg["password"]==null?null:message+="${mapmsg["password"][0]}\n";
      mapmsg["conf_password"]==null?null:message+="${mapmsg["conf_password"]}[0]";
      mapmsg["name"]==null?null:message+="${mapmsg["name"][0]}";
      } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}