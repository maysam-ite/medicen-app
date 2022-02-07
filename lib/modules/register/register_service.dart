import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:medicine/config/user_information.dart';
import 'package:medicine/store/store.dart';

import '../../config/servier_config.dart';
import '../../model/model.dart';

class RegisterService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.registerApi);
  var message;
  var token;
  Future<bool> register(User user) async {
    var response = await http.post(url, body: {
      "email": user.email,
      "password": user.password,
      "conf_password":user.confpassword,
      "name":user.name,

    });
    print(response.body);
    print(response.statusCode);
    var r = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("200 erorr");
      message = r['message'];
      token=r['data'];
      UserInformation.user_token=token;
      StoreInfo info=StoreInfo();
      await info.save("token",UserInformation.user_token);
      return true;
    } else if (response.statusCode == 401) {
      print("401 erorr");
      message = r['message'];
    
      return false;
    } else {
      message = "server erore";
      return false;
    }
  }
}
