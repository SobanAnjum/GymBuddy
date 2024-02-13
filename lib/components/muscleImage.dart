import 'package:flutter/material.dart';

Widget muscleImageMaker(List<String> muscles){

return Center(
  child: Container(
    height: 200,
  
  
  
    child:  Stack(
      children: [
        Image(image: AssetImage('assets/images/Base.png')),
        for(int i=0;i<muscles.length;i++)
        Image(image: AssetImage('assets/images/${muscles[i]}.png')),


        
      ],
    
    ),
  ),
);
}