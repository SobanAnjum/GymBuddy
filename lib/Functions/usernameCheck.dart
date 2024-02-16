
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
 
Future<bool> userExists(String username)async{
try{
final DocumentSnapshot snapshot= await FirebaseFirestore.instance.collection("Users").doc("$username").get();
return snapshot.exists;

}
catch(e){
  return false;
}
}
Future<bool> musclesAlloted()async{
  User? user = FirebaseAuth.instance.currentUser;
try{
final QuerySnapshot snapshot= await FirebaseFirestore.instance.collection("Users").doc("${user?.uid}").collection('ExcerciseData').get();
return snapshot.docs.isNotEmpty;

}
catch(e){
  return false;
}
}