import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/screens/homepage.dart';
import 'package:my_trainer/screens/signin.dart';

checkUser(BuildContext context){
final user=FirebaseAuth.instance.currentUser;

if(user!=null){

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
}
else{
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SigninScreen(),));
}

}