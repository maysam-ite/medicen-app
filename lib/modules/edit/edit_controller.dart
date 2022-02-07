import 'package:get/get.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/model/addproduct_model.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/edit/edit_service.dart';

class EditController extends GetxController{
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
late EditService service;
late bool editstate;
Product_details? model;

@override
  void onInit() {
    model=Get.arguments;
    pname = model!.pname;
    price = model!.price;
    link = model!.like_count.toString();
    expiry_date =model!.expiration;
    madname = model!.madname;
    quantity = model!.quantity;
    category = model!.category;
    contactInfo = model!.contactInfo;
    discount_1 = '';
    date_1 = '';
    discount_2 = '';
    date_2 = '';
    discount_3 = '';
    date_3 = '';
    service = EditService();
    editstate=false;
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
    editstate=await service.edit(user,UserInformation.user_token,model!.user_id);
    
  }
}