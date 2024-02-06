import 'package:flutter/material.dart';
import 'package:my_trainer/components/loginButton.dart';

Widget textFormField(String? text, String key,bool obscure, IconData ico){

  return SizedBox(
    width: 300,
    height: 50,

    child: TextFormField(
      
      key: ValueKey(key),
      obscureText: obscure,
      decoration: InputDecoration(hintText: text,
      suffixIcon: Icon(ico, size: 30),
       enabledBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid,color: Colors.white, width: 1),borderRadius: BorderRadius.circular(15),),
       focusedBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid,color: Color.fromRGBO(0, 255, 234, 1), width: 2),borderRadius: BorderRadius.circular(15),
    )
  )));
}