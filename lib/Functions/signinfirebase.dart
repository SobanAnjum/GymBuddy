import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:my_trainer/Functions/docReferance.dart';
import 'package:my_trainer/screens/homepage.dart';
import 'package:my_trainer/screens/onBoardingScreen.dart';

signinUser(String email, String password,BuildContext currentcontext)async{

  try{
await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) { 
  try{
final snapshot = docSnapshot();
snapshot.then((snapShot) {
var data= snapShot.data() as Map<String, dynamic>;
bool isRegistered = data['isRegistered'];

if(isRegistered){
 Navigator.pushReplacement(currentcontext, MaterialPageRoute(builder: (currentcontext)=>const HomePage()));
}
else{
   Navigator.pushReplacement(currentcontext, MaterialPageRoute(builder: (currentcontext)=>const OnBoardingScreen()));
}
} );

}catch(e){

print(e);
}
  
  
  
 


;});
    
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