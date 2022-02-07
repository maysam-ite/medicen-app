// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool? issecur;
  final Function()? suffixfunction;
  final Function(String) changefunction;
  final String? initvalue;
  const TextFieldCustom({
    required this.icon,
    required this.hint,
    required this.changefunction,
    this.issecur,
    this.suffixfunction,
    this.initvalue
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       initialValue:initvalue ,
      obscureText: issecur?? false,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          hintText: hint,
          prefixIcon:  Icon(
            icon,
            color: Colors.teal,
          ),
          
          suffixIcon: issecur == null
              ? null
              : IconButton(
                  icon: Icon(
                      issecur ==true? Icons.remove_red_eye : Icons.security,
                      color: Colors.teal),
                  onPressed: suffixfunction,
                ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: changefunction,
    );
  }
}
