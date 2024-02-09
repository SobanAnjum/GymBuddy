import 'package:flutter/material.dart';

Widget textField(
  String? text,
  TextEditingController textcontroller,
  TextInputType input
) {
  return SizedBox(
      width: 350,
      height: 50,
      child: TextField(
        keyboardType: input,
        decoration: InputDecoration(
            hintText: text,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(0, 255, 234, 1),
                  width: 2),
              borderRadius: BorderRadius.circular(15),
            )),
        controller: textcontroller,
      ));
}
