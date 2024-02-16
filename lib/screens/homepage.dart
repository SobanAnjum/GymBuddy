import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/Functions/datGetter.dart';
import 'package:my_trainer/Functions/docReferance.dart';
import 'package:my_trainer/Functions/signOut.dart';
import 'package:my_trainer/Functions/usernameCheck.dart';
import 'package:my_trainer/components/muscleImage.dart';
import 'package:my_trainer/providerclasses/muscleDataprovider.dart';
import 'package:my_trainer/screens/bmr.dart';
import 'package:my_trainer/screens/excerciseScreen.dart';
import 'package:my_trainer/screens/excerciseSelection.dart';
import 'package:my_trainer/screens/musclecheck.dart';
import 'package:my_trainer/screens/onBoardingScreen.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
@override

class _HomePageState extends State<HomePage> {
  bool init=false;



  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 0), (){
    if(init==false){
    final muscledata=Provider.of<MuscleData>(context,listen: false);
    muscledata.enabledProvider();
    init=true;

    }
    });



  }
  




  @override
  Widget build(BuildContext context) {

    return Consumer<MuscleData>(builder: (context, provider, child) => Scaffold(
      drawer:  Drawer(
        width:300,
        child: ListView(
          children: [
            DrawerHeader(child: Container(height: 400,width: 300,)),
            ListTile(title: const Text('Muscles Schedule'),
            leading: const Icon(Icons.assignment_turned_in_outlined),
            onTap: (){
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MuscleCheck(),));
            },
            ),
            ListTile(title: const Text('Check BMR'),
            leading: const Icon(Icons.monitor_weight_outlined),
            onTap: (){
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BMRScreen(),));
            },
            ),
            ListTile(title: const Text('Excercise Selection'),
            leading: const Icon(Icons.money_sharp),
            onTap: (){
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExcerciseSelectionScreen(),));
            },
            )
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Home"),centerTitle: true,
      toolbarHeight:70,
      actions:  [
        IconButton(onPressed: (){ Signout(context);}, icon: const Icon(Icons.exit_to_app))
      ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
        muscleImageMaker(provider.todayMuscles()),
        Divider(thickness: 1, indent: 50, endIndent: 50,),
        Text("Today's Excercises",style: TextStyle(fontFamily: 'lemonmilk',fontSize: 30, color: Color.fromRGBO(255, 0, 0, 1)),),
        SizedBox(height: 10,),
         Expanded(
           child: ListView.builder(itemCount:provider.todayExcercises.length, itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(provider.todayExcercises[index]['name']),
                subtitle: Text(provider.todayExcercises[index]['muscle']),
                trailing: Icon(Icons.play_arrow),
                onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ExcerciseScreen(data: provider.todayExcercises[index]),)),
              ),
            );

            
                   },),
         )



           
          
        ],

      ),
    ));
  }
}

