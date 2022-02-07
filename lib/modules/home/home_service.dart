import 'dart:convert';

import 'package:medicine/config/servier_config.dart';
import 'package:http/http.dart' as http;
import 'package:medicine/model/product_model.dart';

class HomeService {
  var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.homeApi);

  Future<List<Product_details>> getproducts(String token) async {
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${token}'},
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
      Map<String, dynamic> m = {
        "pname": "null",
        "price": "null",
        "expiration": "null",
        "madname": "null",
        "quantity": "null",
        "category": "null",
        "contactInfo": "null",
        "id": "null",
        "user_id": "null",
        "comment_count": "null",
        "view_count": "null",
        "like_count": "null"
      };
      return [Product_details.map(m)];
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
      return message = '';
    }
  }
}
