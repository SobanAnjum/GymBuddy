import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

signinUser(String email, String password,BuildContext currentcontext)async{

  try{
await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    
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