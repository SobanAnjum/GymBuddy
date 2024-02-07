import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

signinUser(String email, String password)async{

  try{
await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    
  }
  on FirebaseAuthException catch(e){
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}