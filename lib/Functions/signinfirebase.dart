import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:my_trainer/screens/homepage.dart';

signinUser(String email, String password,BuildContext currentcontext)async{

  try{
await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => Navigator.pushReplacement(currentcontext, MaterialPageRoute(builder: (currentcontext)=>const HomePage())));
    
  }
  on FirebaseAuthException catch(e){
    FlutterToastr.show(e.code.toString().toUpperCase().replaceAll("-", " "), currentcontext);
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}