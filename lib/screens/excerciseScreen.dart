import 'package:flutter/material.dart';
import 'package:my_trainer/components/loginButton.dart';
import 'package:my_trainer/providerclasses/muscleDataprovider.dart';
import 'package:provider/provider.dart';


class ExcerciseScreen extends StatefulWidget {
  final Map data;
  const ExcerciseScreen({super.key, required this.data});

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Consumer<MuscleData>(builder: (context, provider, child) =>  Scaffold(
      appBar: AppBar(
        title:Text(widget.data['name']),
         centerTitle: true,
         backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: 250,
              child: Image(image: AssetImage(widget.data['image']), )),
          ),
          const SizedBox(height: 20,),
          const Text('Description',style: TextStyle(fontFamily: 'lemonmilk',fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),),
          const SizedBox(height: 50,),
          Padding( padding: EdgeInsets.only(left: 10),child: Text(widget.data['Description'])),
          Expanded(
            child: Align(alignment: Alignment.bottomCenter,
            
              
              child: Padding(
                padding: const EdgeInsets.only(bottom:20),
                child: loginSignupBTN("Done", (){
                  provider.removeFromToday(widget.data['name']);
                  Navigator.pop(context);
                  print(provider.todayExcercises);
                  


                }),
              )),
          )


        ],
      ),
    ));
  }
}