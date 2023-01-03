import 'package:flutter/material.dart';

Widget buildTextField(hinttext, controller, prefixicon){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      controller: controller,
      cursorColor:  Color.fromARGB(255, 13, 71, 161),
      decoration: InputDecoration(
        hintText: hinttext,
        fillColor: Colors.white,
        prefixIcon: prefixicon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161),
        ),
      ),
    ),
  ));
}