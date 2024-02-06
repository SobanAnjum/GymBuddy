// ignore: file_names
import 'package:flutter/material.dart';

Widget loginSignupBTN(String text, Function fun){

  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: (){
      fun();
    },
    child: Container(
      width: 300,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(colors: [Color.fromRGBO(255, 0, 0,1),Color.fromRGBO(255, 0, 149, 1)])
      ),
      child: Center(child: Text(text, style: const TextStyle( fontSize: 20,fontFamily:"Poppins", fontWeight: FontWeight.bold),)),

    ),
  );
}