import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:my_trainer/screens/homepage.dart';

signupUser(String email,String password,BuildContext currentcontext) async{

  UserCredential? userCredential;
try {
  userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value){ if(userCredential?.user!=null){
    
  }
    Navigator.pushReplacement(currentcontext, MaterialPageRoute(builder: (context)=>const HomePage()));
    
    }
    );
} on FirebaseAuthException catch (e) {
  FlutterToastr.show(e.code.toString().toUpperCase().replaceAll("-", " "), currentcontext);


  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  
}
