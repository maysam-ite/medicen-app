import 'package:get/get.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/model/addproduct_model.dart';
import 'package:medicine/modules/add_products/add_service.dart';
import 'package:medicine/store/store.dart';

class AddController extends GetxController {
  late String pname;
  late String price;
  late String link;
  late String expiry_date;
  late String madname;
  late String quantity;
  late String category;
  late String contactInfo;
  late String discount_1;
  late String date_1;
  late String discount_2;
  late String date_2;
  late String discount_3;
  late String date_3;
  late AddService service;
  late bool addstate;
   DateTime? dateTime ;

  @override
  void onInit() {
    pname = '';
    price = '';
    link = '';
    expiry_date = '';
    madname = '';
    quantity = '';
    category = '';
    contactInfo = '';
    discount_1 = '';
    date_1='';
    discount_2 = '';
    date_2='';
    discount_3 = '';
    date_3='';
    service = AddService();
    addstate=false;
    super.onInit();
  }

  addProduct() async {
    AddModel user = AddModel(
        pname: pname,
        price: price,
        link: link,
        madname: madname,
        category: category,
        date_1: date_1,
        date_2: date_2,
        date_3: date_3,
        discount_1: discount_1,
        discount_2: discount_2,
        discount_3: discount_3,
        contactInfo: contactInfo,
        expiry_date: expiry_date,
        quantity: quantity
        );
    addstate=await service.add(user,UserInformation.user_token);
    
  }
}
