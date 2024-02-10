import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/Functions/docReferance.dart';



class BMRScreen extends StatefulWidget {

  const BMRScreen({super.key});

  @override
  State<BMRScreen> createState() => _BMR_ScreenState();
}



class _BMR_ScreenState extends State<BMRScreen> {
   double weight=0;
   double height=0;
   var bmr;
   bool isLoading=true;


  @override
  Widget build(BuildContext context) {

try{
final snapshot = docSnapshot();
snapshot.then((snapShot) {
var data= snapShot.data() as Map<String, dynamic>;
var BMR= data['BMR'];
double userWeight= data['weight'];
double userHeight= data['height'];
setState(() {
  weight=userWeight;
  height=userHeight;
  bmr=BMR;
});
setState(() {
  isLoading=false;
});

} ); 
}
catch(e){
  throw(e);
  print(e);
}


    return  Scaffold(
      backgroundColor: color(weight, height),
      body:isLoading?Center(
              child: CircularProgressIndicator(),
            ): Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("You are",style:TextStyle(fontFamily: "Lemonmilk",fontSize: 40) ,)),
          SizedBox(height: 20,),
          Center(child: Text("${bodyStatus(weight, height)}",style:TextStyle(fontFamily: "Lemonmilk",fontSize: 40) ,)),
          SizedBox(height: 40,),
          Center(child: Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Text("${weightOpinion(bodyStatus(weight, height))}",textAlign:TextAlign.center ,style:TextStyle(fontFamily: "poppins",fontSize: 20) ,),
          )),
          SizedBox(height: 60,),
          Text("Weight : ${weight}\nHeight : ${height}\nBMR      : ${bmr.toInt()}",style: TextStyle(fontSize: 20,fontFamily: "Lemonmilk"),)
        ],
      ),

    
    );
  }
}

String bodyStatus(double weight,double height){
height = height* 0.0254;
  double bmi=weight/(height*height);
   if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi >= 18.5 && bmi < 25) {
    return "Normal";
  } else if (bmi >= 25 && bmi < 30) {
    return "Overweight";
  } else {
    return "Obese";
  }

}

Color color(double weight,double height){
  if(bodyStatus(weight, height)=="Underweight"){
    return  Color.fromRGBO(255, 0, 0, 1);
  }
   else if(bodyStatus(weight, height)=="Normal"){
    return  Color.fromRGBO(102, 219, 102, 1);
  }
  else if(bodyStatus(weight, height)=="Overweight"){
    return  Color.fromRGBO(0, 150, 255, 1);
  }
  else{
    return  Color.fromRGBO(255, 0, 0, 1);
  }
}
String weightOpinion(String bodyStatus){
  if(bodyStatus=="Underweight"){
    return  "Bro you gotta eat to stay alive";
  }
   else if(bodyStatus=="Normal"){
    return  "You're doing great but we'll help you do better";
  }
  else if(bodyStatus=="Overweight"){
    return  "Don't Worry you'll get back in shape in no Time";
  }
  else{
    return  "You'll Surely get there. Just Trust the Process";
  }
}
