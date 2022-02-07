import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medicine/component/textfield_custom.dart';
import 'package:medicine/modules/add_products/add_controller.dart';

class AddProduct extends StatelessWidget {
  AddController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "add a new product",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/img21.jpg"),
                  fit: BoxFit.fill)),
          //height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "product name",
                    icon: Icons.medication,
                    changefunction: (val) {
                      controller.madname = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "image URL",
                    icon: Icons.image,
                    changefunction: (val) {
                      controller.pname = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "the price",
                    icon: Icons.money,
                    changefunction: (val) {
                      controller.price = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "Expiration  date",
                    icon: Icons.tablet_rounded,
                    changefunction: (val) {
                      controller.expiry_date = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "link for more info",
                    icon: Icons.link,
                    changefunction: (val) {
                      controller.link = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "Category",
                    icon: Icons.category_rounded,
                    changefunction: (val) {
                      controller.category = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "Quantity",
                    icon: Icons.production_quantity_limits,
                    changefunction: (val) {
                      controller.quantity = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  TextFieldCustom(
                    hint: "contact info",
                    icon: Icons.contact_phone,
                    changefunction: (val) {
                      controller.contactInfo = val;
                    },
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFieldCustom(
                          hint: 'Fisrt price',
                          icon: Icons.price_check,
                          changefunction: (val) {
                            controller.discount_1 = val;
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * .06,
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          hint: 'First Date',
                          icon: Icons.date_range,
                          changefunction: (val) {
                            controller.date_1 = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFieldCustom(
                          hint: 'Second price',
                          icon: Icons.price_check,
                          changefunction: (val) {
                            controller.discount_2 = val;
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * .06,
                      ),
                     Expanded(
                        child: TextFieldCustom(
                          hint: 'Second Date',
                          icon: Icons.date_range,
                          changefunction: (val) {
                            controller.date_2 = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFieldCustom(
                          hint: 'Third price',
                          icon: Icons.price_check,
                          changefunction: (val) {
                            controller.discount_3 = val;
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * .06,
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          hint: 'Third Date',
                          icon: Icons.date_range,
                          changefunction: (val) {
                            controller.date_3 = val;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Container(
                      width: size.width * .50,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          onclickDone();
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onclickDone() async {
    EasyLoading.show(status: 'loading ...');
    await controller.addProduct();
    if (controller.addstate) {
      EasyLoading.showSuccess('Success Add');
      Get.offAllNamed('/home');
    } else {
      EasyLoading.showError('Error Add');
    }
  }

  inittime(BuildContext context, var varDate) async {
    DateTime initialDate = DateTime.now();
    var date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(initialDate.year),
      lastDate: DateTime(initialDate.year + 5),
    );

    if (date == null) return;

    varDate = DateTime(
      date.year,
      date.month,
      date.day,
    );
    print(varDate);
  }
}
