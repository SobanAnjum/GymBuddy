import 'package:flutter/material.dart';

Widget textFormField(String? text, String key,bool obscure){

  return SizedBox(
    width: 270,
    child: TextFormField(
      key: ValueKey(key),
      obscureText: obscure,
      decoration: InputDecoration(hintText: text,
       enabledBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid,color: Colors.white, width: 2),borderRadius: BorderRadius.circular(40),),
       focusedBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid,color: Color.fromRGBO(0, 255, 234, 1), width: 2),borderRadius: BorderRadius.circular(40),
      
    
    )
  )));
}