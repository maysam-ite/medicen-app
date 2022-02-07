import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/card_product/card_product.dart';
import 'package:medicine/modules/drawer/drawer.dart';
import 'package:medicine/modules/home/home_controller.dart';

class Home extends StatelessWidget {
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.teal,
        drawer: DrawerPage(),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          /*to make the appbar have no shadow and maxied */
          title:  Text("My Products".tr),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Get.toNamed('/search');
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/add');
          },
          backgroundColor: Colors.cyan,
          child:const Icon(
            Icons.add,
          ),
        ),
        body: SafeArea(
          child: Obx(() {
            if (controller.isload.isTrue) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightBlue,
                ),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ), //ما بعر ليش ما كانت تزبط اعملها بادنغ من فوق فهي بدالها
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                    ),
                    ListCard(controller.productsList)
                  ],
                ))
              ],
            );
          }),
        ));
  }
}

class ListCard extends StatelessWidget {
  ListCard(this.l);

  final List<Product_details> l;

  @override
  Widget build(BuildContext context) {
    List<Widget> k = [];
    for (var i in l) {
      k.add(Card2(
        model: i,
      ));
    }

    return ListView(
      children: k,
    );
  }
}
