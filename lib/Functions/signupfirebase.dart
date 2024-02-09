import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:my_trainer/Functions/usernameCheck.dart';
import 'package:my_trainer/screens/homepage.dart';

signupUser(String email,String password,String username,BuildContext currentcontext) async{

  UserCredential? userCredential;
  if(await userExists(username)){
    FlutterToastr.show("User Already exists", currentcontext);
  }else{
try {
  

  userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value){ 
    User? user= FirebaseAuth.instance.currentUser;

var parentCollection = FirebaseFirestore.instance.collection("Users"); // Reference to the "Users" collection
var   userDocument = parentCollection.doc(user?.uid);
userDocument.set({}); // Reference to the document within the "Users" collection
var  personalInfoDocument = userDocument.collection("PersonalInformation").doc("infoData");
     personalInfoDocument.set({
  "username" : username,  
  "firstname": "N/A",
  "lastname": "N/A",
  "DOB": "N/A",
  "isRegistered": false,
  "BMR": "N/A",
  "height": "N/A",
  "weight": "N/A",
  "gender": "N/A",
  "email": email,
});
     
  }
   
    
    
    );
Navigator.pushReplacement(currentcontext, MaterialPageRoute(builder: (context)=>const HomePage()));
  }

 on FirebaseAuthException catch (e) {
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
}