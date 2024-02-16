import 'package:flutter/material.dart';
import 'package:my_trainer/Functions/docReferance.dart';
import 'package:my_trainer/providerclasses/muscleDataprovider.dart';
import 'package:my_trainer/screens/homepage.dart';
import 'package:provider/provider.dart';

class MuscleCheck extends StatefulWidget {
  const MuscleCheck({super.key});


  @override
  State<MuscleCheck> createState() => _MuscleCheckState();
  
}


  



class _MuscleCheckState extends State<MuscleCheck> {
  
  @override
  Widget build(BuildContext context) {

return Consumer<MuscleData>(
  builder: (context, value, child) =>Scaffold(
          appBar: AppBar(
            title: const Text('Muscle Group Selection',style: TextStyle(fontFamily: "Lemonmilk",fontSize: 15),),
            centerTitle: true,
            
          ),
         body:  Column(
        children: [
          Expanded(
            child: ListView(
              children: value.muscleMap.keys.map((day) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 13,),
                      child: Text(
                        "$day",
                        style: const TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        for (String exercise in [
                          "Bicep",
                          'Tricep',
                          'Chest',
                          'Abs',
                          'Legs',
                          'Shoulders',
                          'Forearms',
                          'Back'
                        ])
                          Row(
                            mainAxisSize: MainAxisSize.min, // Ensure each row takes minimum space horizontally
                            children: [
                              Checkbox(
                                value: value.muscleMap[day]?.contains(exercise) ?? false,
                                onChanged: (isChecked) {
                                  setState(() {
                                    value.handleCheckbox(day, exercise, isChecked ?? false);
                                  });
                                },
                              ),
                              Text("$exercise"),
                            ],
                          ),
                      ],
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                userRef().collection('ExcerciseData').doc('Day').set(value.muscleMap);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
              },
              child: const Text('Proceed'),
            ),
          ),
        ],
      ),
    ),
);
}}