// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/component/elementcount_custom.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/comments.dart/comment_page.dart';
import 'package:medicine/modules/delete/delete_controller.dart';
import 'package:medicine/modules/home/home_controller.dart';

class Card2 extends StatelessWidget {
  HomeController controller = Get.find();
  Product_details model;
  //int i;
  Card2({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.defaultDialog(content: Details(model: model),
        backgroundColor: Colors.white,
        radius: 20,
        title: ''
        );
       
      },
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .04),
        child: Container(
          width: size.width * .95,
          height: size.height * .15,
          margin: EdgeInsets.only(
              left: size.width * .025,
              right: size.width * .03,
              bottom: size.height * .02),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                offset: Offset(0, 15), blurRadius: 10, color: Colors.black38)
          ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(children: [
            Container(
              width: size.width * .30,
              height: size.height * .15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/drawer.jpg'))),
            ),
            Expanded(
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: size.height * .025),
                  child: Text(
                    model.madname,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: size.height * .01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElementPro(
                        icon: Icons.remove_red_eye,
                        count: model.view_count.toString(),
                      ),
                      ElementPro(
                        icon: Icons.comment,
                        count: model.comment_count.toString(),
                        ontap: (){
                          showComment();
                        },
                      ),
                      Obx(() {
                        return ElementPro(
                          icon: Icons.thumb_up,
                          count: model.like_count.toString(),
                          ontap: () {
                            clicklike(model.id);
                          },
                          islike: controller.islike[model.id + 1].value,
                        );
                        ;
                      })
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: size.width * .02,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElementRow(
                      icon: Icons.edit,
                      ontap: () {
                      /*EditController c=Get.find();
                      c.model=model;*/
                        Get.toNamed('/edit',arguments: model
                            );
                          //  Get.to(EditPage(),arguments:model );
                      },
                    ),
                    SizedBox(
                      height: size.height * .1 / 3,
                    ),
                    ElementRow(
                      icon: Icons.delete,
                      ontap: () {
                        clickdelete(size.width*.7);
                      },
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }

  clicklike(int id) async {
    await controller.onclicklike(id);
  }
  showComment(){
    Get.defaultDialog(
      content: CommentPage(),
      backgroundColor: Colors.white,
      title: '',
      radius: 10
    );
  }
  clickdelete(double size) async {
    //DeleteBinding(id: model.id);
    DeleteController controller2 = Get.put(DeleteController(id:model.id));
    if (controller2.deleteState) {
      await controller.updateProducts();
      Get.showSnackbar( GetSnackBar(
        title: "Delete Complete",
        duration:const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        borderRadius: 20,
        padding:const EdgeInsets.all(10),
       
        message: "ddd",
       maxWidth: size,
      ),);
    } else {
      Get.showSnackbar( GetSnackBar(
        title: "Delete Failed",
        duration:const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        borderRadius: 20,
        padding:const EdgeInsets.all(10),
         message: "ddd",
         snackStyle: SnackStyle.FLOATING,
          maxWidth: size,
      ));
    }
  }
}

// ignore: must_be_immutable
class Details extends StatelessWidget {
  Product_details model;
  Details({required this.model});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .70,
      height: size.height * .70,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/drawer.jpg',
                width: size.width * .20,
                height: size.height * .20,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: size.height * 0.05,
          ),
          Card(
            child: Text("Name :${model.madname}", style: t),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Card(
            child: Text("Price :${model.price}", style: t),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Card(
            child: Text("uantity_Available :${model.quantity}", style: t),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Card(
            child: Text("expiration_date :${model.expiration}", style: t),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Card(
            child: Text("contact_info :${model.contactInfo}", style: t),
          ),
        ],
      ),
    );
  }

  TextStyle t = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, color: Colors.teal[700]);
}
