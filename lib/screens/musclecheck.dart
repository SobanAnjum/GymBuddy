import 'package:flutter/material.dart';

class MuscleCheck extends StatefulWidget {
  const MuscleCheck({super.key});


  @override
  State<MuscleCheck> createState() => _MuscleCheckState();
}

  Map<String,List<String>> muscleMap={
  "Monday":[],
  "Tuesday":[],
  "Wednesday":[],
  "Thursday":[],
  "Friday":[],
  "Saturday":[],
  "Sunday":[],
};

void handleCheckbox(String day, String muscle, bool isChecked){
setState(){
}
  if(isChecked){
    muscleMap[day]?.add(muscle);
  }
  else{
    muscleMap[day]?.remove(muscle);
  }
}



class _MuscleCheckState extends State<MuscleCheck> {
  @override
  Widget build(BuildContext context) {

return Scaffold(
        appBar: AppBar(
          title: Text('Muscle Group Selection'),
        ),
       body:  Column(
      children: [
        Expanded(
          child: ListView(
            children: muscleMap.keys.map((day) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "$day",
                      style: TextStyle(
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
                              value: muscleMap[day]?.contains(exercise) ?? false,
                              onChanged: (isChecked) {
                                setState(() {
                                  handleCheckbox(day, exercise, isChecked ?? false);
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
              print(muscleMap);
            },
            child: Text('Proceed'),
          ),
        ),
      ],
    ),
  );
}}