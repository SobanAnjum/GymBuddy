import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/Functions/signOut.dart';
import 'package:my_trainer/screens/onBoardingScreen.dart';
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
  onTap: ()  {
Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen(),));


  })


           
          
        ],

      ),
    );
  }
}