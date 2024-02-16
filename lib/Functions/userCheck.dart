import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/screens/homepage.dart';
import 'package:my_trainer/screens/signin.dart';

checkUser(){
final user=FirebaseAuth.instance.currentUser;
return user;

}