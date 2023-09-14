import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
   TextEditingController controller;
  String labeltext;
  String hinttext;
  var icon;
  textFormField({
    required this.controller,
    required this.labeltext,
    required this.hinttext,
    required this.icon

  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
          ),
          prefixIcon: icon,
        labelText: labeltext,
        hintText: hinttext,
        ),
      ),
    );
  }
}