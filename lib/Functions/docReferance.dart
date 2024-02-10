import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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