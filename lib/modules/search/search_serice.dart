import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:medicine/config/user_information.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/store/store.dart';

import '../../config/servier_config.dart';
import '../../model/model.dart';

class SearchService {
  var url1 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.searchNameApi);
  var url2 = Uri.parse(ServerConfig.domainNameServer + ServerConfig.searchDateApi);
  
  var message;
  Future<List<Product_details>> searchName(String value,String token) async {
    var response = await http.post(url1, 
     headers: {'Authorization': 'Bearer ${token}'},
    
    body: {
      "name":value
    }
     );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
       var r = jsonDecode(response.body);
      List<dynamic> articles = r['data'];
      List<Product_details> model = [];
      for (var i in articles) {
        model.add(Product_details.map(i));
    }
    
    return model;
    } else if (response.statusCode == 401) {
     
      return [];
    } else {
      
      return [];
    }
  }
  Future<List<Product_details>> searchDate(String value,String token) async {
    var response = await http.post(url2, 
     headers: {'Authorization': 'Bearer ${token}'},
    
    body: {
      "expiry_date":value
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
       var r = jsonDecode(response.body);
      List<dynamic> articles = r['data'];
      List<Product_details> model = [];
      for (var i in articles) {
        model.add(Product_details.map(i));
    }
    
    return model;
    } else if (response.statusCode == 401) {
     
      return [];
    } else {
      
      return [];
    }
  }
 Future<String> like(int product_id, String token) async {
    var url = Uri.parse(
        ServerConfig.domainNameServer + '/api/product/${product_id}/like');

    var response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ${token}'},
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var r = jsonDecode(response.body);
      return message = r['message'];
    } else {
     return  message = '';
    }
  }
}
