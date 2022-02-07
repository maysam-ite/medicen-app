import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*.5,
      alignment: Alignment.bottomLeft,
      color: Colors.red,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context,i){
          return Text("data");
        }
      
      ),
    );
  }
}