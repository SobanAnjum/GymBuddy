import 'package:flutter/material.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({super.key});

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}
var day="Day";
var month="Month";
var year="Year";

class _DatePickerCustomState extends State<DatePickerCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

        child:Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            Container(
          
              width: 80,
              child: TextField(
                 textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration( border: OutlineInputBorder(
                ),
                hintText: day
            
                ),
              ),
            ),
            Container(
              width: 80,
              child: TextField(
                 textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration( border: OutlineInputBorder(
                ),
                hintText: month
            
                ),
              ),
            ),
            Container(
              width: 80,
              child: TextField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration( border: OutlineInputBorder(
                ),
                hintText: year,
                
            
                ),
              ),
            ),
            InkWell(
              child: 
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1),borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("Date Picker",style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1), fontFamily: "poppins",fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
              ),
            )
          
          
          
          ],),
        )

        );

    
  }
}
