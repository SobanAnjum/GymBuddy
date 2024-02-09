import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:my_trainer/components/datePicker.dart';
import 'package:my_trainer/components/textField.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController fName = TextEditingController();
    TextEditingController lName = TextEditingController();
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();
    TextEditingController age = TextEditingController();





    Future<DateTime?> picked;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 10),
              child: Container(child: Center(child: Text("Let's Get Started",style:TextStyle(color: Color.fromRGBO(255, 0, 0, 1),fontFamily: "poppins",fontWeight:FontWeight.bold, fontSize: 35,),textAlign:TextAlign.center ,))),
            ),
            Container( child: Center( child: Text("Introduce Yourself",style:TextStyle(fontFamily: "poppins",fontWeight: FontWeight.normal ,fontSize: 20,),),)),
            SizedBox(height: 20,),
            textField("First Name", fName,TextInputType.text),
            SizedBox(height: 15,),
            textField("Last Name", fName,TextInputType.text),
            SizedBox(height: 15,),
            textField("Age", age,TextInputType.number),
            SizedBox(height: 20,),
            DatePickerCustom(),

            


        
            
            
            
              
           
          ],
        ),
      ),
    );
  }

  
}
