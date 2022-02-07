import 'dart:convert';

import 'package:medicine/config/servier_config.dart';
import 'package:http/http.dart' as http;
import 'package:medicine/config/user_information.dart';
import 'package:medicine/store/store.dart';

class LogoutService {
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logoutApi);
  Future<bool> logout(String token) async {
    var response = await http.get(url,
    headers: {'Authorization': 'Bearer ${token}'}
    );
    print(response.statusCode);
    var r = jsonDecode(response.body);
    if (response.statusCode == 200) {
      
      UserInformation.user_token='';
      StoreInfo info=StoreInfo();
      await info.remove("token");
      message=r["message"];
      return true;
    } else if (response.statusCode == 401) {    
      message=r["message"];
      return false;
    } else {
      message=r["message"];
      return false;
    }
  }
}