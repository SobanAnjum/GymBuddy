import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/Functions/signOut.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Home"),centerTitle: true,
      actions:  [
        IconButton(onPressed: (){ Signout(context);}, icon: const Icon(Icons.exit_to_app))
      ],
      ),
      body: Column(
        children: [
          InkWell(
  child: Text("Check Document Existence"),
  onTap: () async {
final parentCollection = FirebaseFirestore.instance.collection("Users");
final  userDocument = parentCollection.doc("username");
userDocument.set({}); // Reference to the document within the "Users" collection
final  personalInfoDocument = userDocument.collection("PersonalInformation").doc("infoData");
    personalInfoDocument.set({
  "firstname": "N/A",
  "lastname": "N/A",
  "DOB": "N/A",
  "isRegistered": false,
  "BMR": "N/A",
  "height": "N/A",
  "weight": "N/A",
  "gender": "N/A",
  "email": "email",
});
  },
)


           
          
        ],

      ),
    );
  }
}