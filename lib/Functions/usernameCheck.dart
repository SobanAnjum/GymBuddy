
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 
 
Future<bool> userExists(String username)async{
try{
final DocumentSnapshot snapshot= await FirebaseFirestore.instance.collection("Users").doc("username").get();
return snapshot.exists;

}
catch(e){
  return false;
}
}