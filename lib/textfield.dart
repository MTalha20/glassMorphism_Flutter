import 'package:flutter/material.dart';

Color fieldColor = Color.fromARGB(255, 13, 71, 161);

Widget buildTextField(hinttext, controller, prefixicon){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      controller: controller,
      cursorColor:  fieldColor,
      decoration: InputDecoration(
        hintText: hinttext,
        fillColor: Colors.white,
        prefixIcon: prefixicon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: fieldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: fieldColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: fieldColor,
        ),
      ),
    ),
  ));
}