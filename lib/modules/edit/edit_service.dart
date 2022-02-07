import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicine/model/addproduct_model.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/add_products/add_page.dart';

import '../../config/servier_config.dart';

class EditService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.editApi);


  Future<bool> edit(AddModel user, var token,int id) async {
    var response = await http.put(url, headers: {
      'Authorization': 'Bearer ${token}'
    }, body: {
      "id":id.toString(),
      "name": user.madname,
      "price": user.price,
      "expiry_date": user.expiry_date,
      "quantity": user.quantity,
      "image": user.pname,
      "contact_info": user.contactInfo,
      "category": user.category,
      "discount_1": user.discount_1,
      "date_1": user.date_1,
      "discount_2": user.discount_2,
      "date_2": user.date_2,
      "discount_3": user.discount_3,
      "date_3": user.date_3
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
