import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

DocumentReference docRef(){
  User? user= FirebaseAuth.instance.currentUser;

var parentCollection = FirebaseFirestore.instance.collection("Users"); // Reference to the "Users" collection
var   userDocument = parentCollection.doc(user?.uid);
userDocument.set({}); // Reference to the document within the "Users" collection
var  personalInfoDocument = userDocument.collection("PersonalInformation").doc("infoData");
return personalInfoDocument;
}
Future<DocumentSnapshot<Object?>> docSnapshot(){
 User? user= FirebaseAuth.instance.currentUser;

var parentCollection =  FirebaseFirestore.instance.collection("Users"); // Reference to the "Users" collection
var   userDocument = parentCollection.doc(user?.uid);
userDocument.set({}); // Reference to the document within the "Users" collection
var  personalInfoDocument = userDocument.collection("PersonalInformation").doc("infoData").get();
return personalInfoDocument;
}

DocumentReference userRef(){
  User? user= FirebaseAuth.instance.currentUser;

var parentCollection = FirebaseFirestore.instance.collection("Users"); // Reference to the "Users" collection
var   userDocument = parentCollection.doc(user?.uid);
userDocument.set({}); // Reference to the document within the "Users" collection

return userDocument;
}

MuscleDataGetter(String day,BuildContext context)async{
var docGetter=await userRef().collection('ExcerciseData').doc('Day').get();
if(docGetter.exists){
  var data= docGetter.data() as Map<String,dynamic>;
  List<String> muscles = List<String>.from(data[day]);
  return muscles;


}
else{
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Doc not found")));
}
}





