import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/Functions/apiget.dart';
import 'package:my_trainer/Functions/datGetter.dart';
import 'package:my_trainer/Functions/docReferance.dart';
import 'package:my_trainer/Functions/signOut.dart';
import 'package:my_trainer/components/muscleImage.dart';
import 'package:my_trainer/screens/bmr.dart';
import 'package:my_trainer/screens/musclecheck.dart';
import 'package:my_trainer/screens/onBoardingScreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
@override

class _HomePageState extends State<HomePage> {
  Future<List<String>> muscles()async{
    List<String> data=await MuscleDataGetter(getToday(),context);
setState(() {
  todayMuscles = data;
});
return data;
  }
  List<String> todayMuscles=[];
  
  @override
  void initState() {
    super.initState();
    muscles();
    
  }



  @override
  Widget build(BuildContext context) {
     muscles();
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
//Navigator.push(context, MaterialPageRoute(builder: (context) => MuscleCheck(),));
  onTap: ()  async{


print(todayMuscles);


  }),

  muscleImageMaker(todayMuscles)

           
          
        ],

      ),
    );
  }
}