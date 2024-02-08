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
            onTap:(){
              FirebaseFirestore.instance.collection("Users").doc("Sobananjum0").set(
              {
                "name":"Soban"

              }
              );

            } ,
            child: const Text("Upload to Database"),
          )
        ],

      ),
    );
  }
}