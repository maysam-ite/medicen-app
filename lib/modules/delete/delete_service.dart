import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../config/servier_config.dart';

class DeleteService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.deleteApi);


  Future<bool> delete(int id, var token) async {
    var response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${token}'
    }, body: {
     "id":id
    });
    print(response.body);
    print(response.statusCode);
    var r = jsonDecode(response.body);
    if(response.statusCode==200){
      return true;
    }else if(response.statusCode==401){
      return false;
    }else {return false;}
  }
}
