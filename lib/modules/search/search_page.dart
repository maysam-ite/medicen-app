import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine/component/textfield_custom.dart';
import 'package:medicine/model/product_model.dart';
import 'package:medicine/modules/card_product/card_product.dart';
import 'package:medicine/modules/search/search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchContoller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Get.isDarkMode
                ? Colors.white
                : Colors.black, //change your color here
          ),
          title: TextFieldCustom(
            hint: "Search",
            icon: Icons.search,
            changefunction: (val) {
              c.searchvalue=val;
              c.isdone(false);
            },
          ),
          actions: [
            GestureDetector(
              onTap: () {
                
                onclickDo();
                c.isdone(true);

              },
              child: const Icon(Icons.done,color: Colors.teal,),
            )
          ],
        ),
        body: Column(
          children: [
            Obx((){
              return  Row(
              children: [
                Expanded(
                    flex: 1,
                    child: RadioListTile(
                        title: const Text("Name"),
                        value: "name",
                        groupValue: c.searchtype.value,
                        onChanged: (t) {
                          c.isdone(false);
                          changetypesearch(t.toString());
                        })),
                Expanded(
                    flex: 1,
                    child: RadioListTile(
                        title: const Text("date"),
                        value: "date",
                        groupValue: c.searchtype.value,
                        onChanged: (t) {
                          c.isdone(false);
                          changetypesearch(t.toString());

                        })),
              ],
            );
            }),
           
            const SizedBox(
              height: 10,
            ),
            Obx((){
             return  Expanded(
              child: c.isdone.isTrue
                  ? get()
                  : Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(child:Text(""))),
            );
            })
           
          ],
        ));
  }

  changetypesearch(String type) {
    print("c");
    c.searchtype(type);

  }
  //List k=[];
   onclickDo() async {
    await c.doSearch();

  }

  Widget get() {
    if (c.isload.isTrue) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.lightBlue,
        ),
      );
    } else {
      print("k");
      List<Widget> k = [];
      for (var i in c.productsList) {
        k.add(Card2(
          model: i,
        ));
      }
      
      return ListView(
        children: k,
      );
    }
  }
}
