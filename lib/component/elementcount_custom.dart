import 'package:flutter/material.dart';

class ElementPro extends StatelessWidget {
  final IconData icon;
  final String count;
  Function()? ontap;
  bool? islike;
  ElementPro({required this.count, required this.icon, this.ontap, this.islike});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.only(bottom:30, left: 0),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              GestureDetector(
                  onTap: ontap,
                  child:
                    Icon(icon,
                      color: islike == null
                          ? Colors.teal
                          : islike == true
                              ? Colors.blueAccent
                              : Colors.teal)),
             
               Text(count),
            ],
          )
        
          
        );
  }
}

class ElementRow extends StatelessWidget {
  final IconData icon;
  Function()? ontap;
  ElementRow({required this.icon, this.ontap});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(onTap: ontap, child: Icon(icon, color: Colors.teal));
  }
}
