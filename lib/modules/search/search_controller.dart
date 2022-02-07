import 'package:get/state_manager.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/search/search_serice.dart';

class SearchContoller extends GetxController {
  late RxString searchtype;
  late String searchvalue;
  late SearchService service;
  late List<Product_details> productsList;
  var isload = true.obs;
  var isdone=false.obs;
  List<RxBool> islike = [];
  @override
  void onInit() {
    searchtype = "name".obs;
    searchvalue = '';
    service = SearchService();
    productsList = [];
     for(int i=0;i<=productsList.length+2;i++){
      islike.add(false.obs);
    }
    super.onInit();
  }
  var message;
  onclicklike(int id)async {
    
   message =await service.like(id, UserInformation.user_token);
   
   if(message!=''){
     if(message==' Like successfully removed'){
       islike[id+1](false);

     }
     else{
        islike[id+1](true);
     }
   }
   else{

   }}

   doSearch() async {
    isload(true);
    if (searchtype == 'name') {
      productsList =
          await service.searchName(searchvalue, UserInformation.user_token);
      isload(false);
      
    } else {
      print("date mode");
      productsList =
          await service.searchDate(searchvalue, UserInformation.user_token);
      isload(false);
      
    }
  }
}
