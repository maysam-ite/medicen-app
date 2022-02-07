import 'package:get/get.dart';

import '../../model/model.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  late bool passwordsecrity;
  late String email;
  late String password;
  late LoginService service;
  late String message;
  late bool loginstate;

  @override
  void onInit() async {
    passwordsecrity = true;
    email = '';
    password = '';
    message = '';
    service = LoginService();
    loginstate = false;
    super.onInit();
  }

  void c() {
    passwordsecrity = !passwordsecrity;
    update();
  }

  Future<void> loginclick() async {
    User user = User(email: email, password: password);
    loginstate = await service.login(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
      message = '${mapmsg["email"][0]}\n${mapmsg["password"][0]}';
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
