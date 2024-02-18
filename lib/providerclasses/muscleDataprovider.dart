import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_trainer/Functions/datGetter.dart';

class MuscleData extends ChangeNotifier{


  Map<String,List<String>> muscleMap={
  "Monday":[],
  "Tuesday":[],
  "Wednesday":[],
  "Thursday":[],
  "Friday":[],
  "Saturday":[],
  "Sunday":[],
};
////////////////////////////////////////////////////

void handleCheckbox(String day, String muscle, bool isChecked){
  if(isChecked){
    muscleMap[day]?.add(muscle);
  }
  else{
    muscleMap[day]?.remove(muscle);
  }
  notifyListeners();
  muscleToDB();
}
////////////////////////////////////////////////////
List<String> todayMuscles(){
  List <String>muscles= [];
   muscles=muscleMap[getToday()]??[];
  return muscles;
}
///////////////////////////////////////////////////
///

List<Map> excercises=[
{
  'name':'Bench Press',
  'muscle':'Chest',
  'image':'assets/gifs/Barbell Bench Press.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Back Cable Row',
  'muscle':'Back',
  'image':'assets/gifs/Back Cable Row.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Barbell Bicep Curl',
  'muscle':'Bicep',
  'image':'assets/gifs/Barbell Bicep Curl.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Barbell Shrug',
  'muscle':'Shoulders',
  'image':'assets/gifs/Barbell Shrug.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Barbell Squat',
  'muscle':'Legs',
  'image':'assets/gifs/Barbell Squat.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Barbell Wrist Twist',
  'muscle':'Forearms',
  'image':'assets/gifs/Barbell Wrist Twist.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Bicycle Kicks',
  'muscle':'Abs',
  'image':'assets/gifs/Bicycle Kicks.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Cable Bicep Curl',
  'muscle':'Bicep',
  'image':'assets/gifs/Cable Bicep Curl.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Cable Straight Arm Pulldown',
  'muscle':'Bicep',
  'image':'assets/gifs/Cable Straight Arm Pulldown.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Cable Straight Back Seated Row',
  'muscle':'Back',
  'image':'assets/gifs/Cable Straight Back Seated Row.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Cable Tricep Pushdown',
  'muscle':'Tricep',
  'image':'assets/gifs/Cable Tricep Pushdown.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Dumbell Curl',
  'muscle':'Bicep',
  'image':'assets/gifs/Dumbell Curl.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Cable Straight Arm Pulldown',
  'muscle':'Bicep',
  'image':'assets/gifs/Cable Straight Arm Pulldown.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Dumbell Lateral Raise',
  'muscle':'Shoulders',
  'image':'assets/gifs/Dumbell Lateral Raise.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Dumbell Row',
  'muscle':'Back',
  'image':'assets/gifs/Dumbell Row.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Hammer Curl',
  'muscle':'Bicep',
  'image':'assets/gifs/Hammer Curl.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Inclined Dumbell Press',
  'muscle':'Chest',
  'image':'assets/gifs/Inclined Dumbell Press.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Lat Pulldown',
  'muscle':'Back',
  'image':'assets/gifs/Lat Pulldown.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Leg Push',
  'muscle':'Legs',
  'image':'assets/gifs/Leg Push.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Leg Raise',
  'muscle':'Legs',
  'image':'assets/gifs/Leg Raise.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Push up',
  'muscle':'Chest',
  'image':'assets/gifs/Push up.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Rear Back Cable Pull',
  'muscle':'Back',
  'image':'assets/gifs/Rear Back Cable Pull.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Barbell Raise',
  'muscle':'Shoulders',
  'image':'assets/gifs/Shoulder1.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Single Dumbell Curl',
  'muscle':'Bicep',
  'image':'assets/gifs/Single Dumbell Curl.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Sit ups',
  'muscle':'Abs',
  'image':'assets/gifs/Sit ups.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Skull Crusher',
  'muscle':'Tricep',
  'image':'assets/gifs/Skull Crusher.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Stringt Dumbell Press',
  'muscle':'Chest',
  'image':'assets/gifs/Stringt Dumbell Press.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Tricep Dips',
  'muscle':'Tricep',
  'image':'assets/gifs/Tricep Dips.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Weight Raise',
  'muscle':'Shoulders',
  'image':'assets/gifs/Weight Raise.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},
{
  'name':'Weight Reverse Wrist Curl',
  'muscle':'Forearms',
  'image':'assets/gifs/Weight Reverse Wrist Curl.gif',
  'Description':'Plant your legs on the ground, Tuck in your Arms, Don\'t Flare them outside. Now Complete the Movement as shown in the Image',
  'selected':false
},

];
/////////////////////////////////////////////////////////
List<String> muscleExerciseGetter(String muscle) {
  List<String> exerciseNames = [];
  for (var exercise in excercises) {
    if (exercise['muscle'] == muscle) {
      exerciseNames.add(exercise['name']);
      //notifyListeners();
    }
  }
  return exerciseNames;
}
////////////////////////////////////////////////////////////
bool valueProvider(String name){
  bool condition=false;

  for(var value in excercises){
    if(value['name']==name){
      condition= value['selected'];
      break;

    }
    
  }
  return condition;
}
/////////////////////////////////////////////////////////////////////

excerciseHandler(bool onChanged,String name){
if(onChanged){
  for(var value in excercises){
    if(value['name']==name){
      value['selected']=true;
}
notifyListeners();
excerciseToDB();
}

}
else{
  for(var value in excercises){
    if(value['name']==name){
      value['selected']=false;
}

  
}
}
}
var todayExcercises=[];
//////////////////////////////////////////////////////////////
enabledProvider(){
  todayExcercises.clear();
  var todayMuscle=todayMuscles();
   List<Map> enabledMap=[];
   for( int i=0;i<todayMuscle.length;i++){
  for(var value in excercises){
    if(value['muscle']==todayMuscle[i]&&value['selected']==true){
      enabledMap.add(value);
      todayExcercises.add(value);
      notifyListeners();
    }
  }
   }
//todayExcercises=enabledMap;
notifyListeners();
return enabledMap;
}
////////////////////////////////////////////////////////////
removeFromToday(String name){
  todayExcercises.removeWhere((element) => element['name']==name);
  notifyListeners();
}
////////////////////////////////////////////////
excerciseToDB()async{
  var excercisebox=Hive.box('Excercises');
  for(var entry in excercises){
    await excercisebox.put(entry['name'], entry);
  }

}
////////////////////////////////////////////////////
muscleToDB()async{
  var daybox=Hive.box('Daymap');
   for(var entry in muscleMap.keys){
    await daybox.put(entry, muscleMap[entry]);
  }
notifyListeners();
}
////////////////////////////////////////////
dbToExcercise()async{
  excercises.clear();
  var excercisebox=Hive.box('Excercises');
for(var entry in excercisebox.keys){
   excercises.add(await excercisebox.get(entry));

}
notifyListeners();
}
/////////////////////////////////////////
dbToMuscle()async{
  muscleMap.clear();
  var musclebox=Hive.box('Daymap');
  for(var entry in musclebox.keys){
    muscleMap[entry]=await musclebox.get(entry);

  }
  notifyListeners();
}
///////////////////////////////////////////
setupDB()async{
  var excercisebox=Hive.box('Excercises');
  var musclebox=Hive.box('Daymap');
  if( excercisebox.isEmpty){
     await excerciseToDB();
  }
  else{
     await dbToExcercise();

  }
    if(musclebox.isEmpty){
    await muscleToDB();
  }
  else{
     await dbToMuscle();

  }
  notifyListeners();

}

}