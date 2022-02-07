import 'package:get/get.dart';
import 'package:medicine/config/user_information.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/home/home_service.dart';

class HomeController extends GetxController{
  HomeService service=HomeService();
  List<Product_details> productsList=[];
  var isload=true.obs;
  List<RxBool> islike=[];
  String? message='';

  @override
  onReady() async{
   await checktokn();
     for(int i=0;i<=productsList.length+2;i++){
      islike.add(false.obs);
    }
    isload(false);
    super.onReady();
  }
 checktokn()async{
    productsList=(await service.getproducts(UserInformation.user_token));
    if(productsList[0].madname=="null"){
      Get.offAllNamed('/login');
    }
 }
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
  updateProducts() async{
        productsList=(await service.getproducts(UserInformation.user_token));
    
    isload(true);
  }
}