import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:my_trainer/Functions/datGetter.dart';
import 'package:my_trainer/Functions/docReferance.dart';
import 'package:my_trainer/Functions/signOut.dart';
import 'package:my_trainer/Functions/usernameCheck.dart';
import 'package:my_trainer/components/loginButton.dart';
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
  bool init=false;
class _HomePageState extends State<HomePage> {




  @override
  void initState() {
    super.initState();
     final muscledata=Provider.of<MuscleData>(context,listen: false);
      //muscledata.setupDB();
      if(Hive.box('Daymap').isEmpty){
        muscledata.muscleToDB();
      }else{
       muscledata.dbToMuscle();
      }
    
      print(muscledata.muscleMap);
       if(Hive.box('Excercises').isEmpty){
        muscledata.excerciseToDB();
      }else{
       muscledata.dbToExcercise();
      }
  
    Future.delayed( Duration(seconds: 0), ()async{
    if(init==false){
      var daybox=Hive.box('lastOpened');
    final muscledata=Provider.of<MuscleData>(context,listen: false);
    if(daybox.isEmpty){
      daybox.put('lastRan',DateTime.now().day);
      muscledata.enabledProvider();
    }
    else if(daybox.isNotEmpty&& daybox.get('lastRan')!=DateTime.now().day){
      muscledata.enabledProvider();
      daybox.put('lastRan',DateTime.now().day);
    }
    

    print('entered the init state with init as $init');
    setState(() {
        init=true;
        print('now init is $init');
    });
  

    }
  

     
    
      //print(Hive.box('Excercises').values);

      // print(muscledata.muscleMap);
      // print(muscledata.excercises);


    });


  }
  




  @override
  Widget build(BuildContext context){

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
            ),
            ListTile(title: const Text('Clear Database'),
            leading: const Icon(Icons.money_sharp),
            onTap: ()async{
            var hivebox=Hive.box('Daymap');
            await hivebox.clear();
            final snackbar=SnackBar(content: Text("DB Cleared"));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
            )
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Home"),centerTitle: true,
      toolbarHeight:70,
      actions:  [
        IconButton(onPressed: (){ 
          Hive.box('Daymap').clear;
          Hive.box('Excercises').clear;
          Signout(context);}, icon: const Icon(Icons.exit_to_app))
      ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
        muscleImageMaker(provider.todayMuscles()),
        Divider(thickness: 1, indent: 50, endIndent: 50,),
        Text("Today's Excercises",style: TextStyle(fontFamily: 'lemonmilk',fontSize: 30, color: Color.fromRGBO(255, 0, 0, 1)),),
        SizedBox(height: 10,),
        if(provider.todayExcercises.isEmpty && provider.muscleMap[getToday()]?.isEmpty==true)
        const Text("Today's a Rest Day go enjoy yourself")
        else if(provider.todayExcercises.isEmpty&&provider.muscleMap[getToday()]!=[])
        Expanded(
          child: Column(
            children: [
               Text("You Have Finished all your Excercises"),
               Expanded(
                
                 child: Align(
                  alignment: Alignment.bottomCenter,
                   child: Padding(
                    
                     padding: const EdgeInsets.only(bottom: 20),
                     child: loginSignupBTN("Reset today's Excercise", (){
                     
                      provider.enabledProvider();
                     }),
                   ),
                 ),
               )
            ],
          ),
        )
,
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

