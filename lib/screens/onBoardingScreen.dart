import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get.dart';
import 'package:my_trainer/Functions/writeProfile.dart';
import 'package:my_trainer/components/datePicker.dart';
import 'package:my_trainer/components/loginButton.dart';
import 'package:my_trainer/components/textField.dart';
import 'package:my_trainer/screens/bmr.dart';

  TextEditingController fName = TextEditingController();
    TextEditingController lName = TextEditingController();
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();
    TextEditingController age = TextEditingController();
    var day="Day";
    var month="Month";
    var year="Year";
    var gender="Male";






class OnBoardingScreen extends StatefulWidget {

    
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 80,),
            textField("First Name", fName,TextInputType.text),
            SizedBox(height: 30,),
            textField("Last Name", lName,TextInputType.text),
            SizedBox(height: 30,),
            // textField("Age", age,TextInputType.number),
            // SizedBox(height: 20,),
            Container(
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
              onTap: ()async{
                DateTime? picked=await showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime.now(), );
                if(picked!=null){
                  setState(() {
                  day=picked.day.toString();
                  month=picked.month.toString();
                  year=picked.year.toString();
                }

                
                );}
              },
              child: 
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(color: const Color.fromRGBO(255, 255, 255, 1),borderRadius: BorderRadius.circular(5)),
                child: const Center(child: Text("Date Picker",style: TextStyle(color: Color.fromRGBO(255, 0, 0, 1), fontFamily: "poppins",fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
              ),
            ),
          
   
],),
        )

        ),
        SizedBox(height: 30,),
         Row(
           children: [
             StatefulBuilder(
               builder: (BuildContext context, StateSetter setState) {
                 return Padding(
                   padding: const EdgeInsets.only(left: 35,right: 35),
                   child: Center(
                     child: Container(
                       width: 300,
                       height: 60,
                       decoration: BoxDecoration(border:Border.all(color:Colors.grey, ), borderRadius: BorderRadius.circular(5)),
                       child: Center(
                         child: Padding(
                           padding: const EdgeInsets.only(left: 0,right: 0),
                           child: DropdownButton<String>(
                                         
                                         
                                         underline: Container(),
                                         alignment: Alignment.center,
                                         style: TextStyle(),
                                       
                                         
                                         
                                         value: gender,
                                         items: const [
                                           DropdownMenuItem(value: "Male", child: Text("Male")),
                                           DropdownMenuItem(value: "Female", child: Text("Female")),
                                           DropdownMenuItem(value: "Other", child: Text("Other")),
                                         ],
                                         onChanged: (String? value) {
                                           setState(() {
                                             gender = value ?? "Male"; // Set default value to "Male" if null
                                           });
                                         },
                           ),
                         ),
                       ),
                     ),
                   ),
                 );
               },
             ),
             
           ],
           
         ),
         SizedBox(height: 30,),
         textField("Weight in KG's", weight,TextInputType.number),
         SizedBox(height: 30,),
         textField("Height in Inches", height,TextInputType.number),
         SizedBox(height: 60,),
         loginSignupBTN("Proceed", (){


          if(fName.text.isEmpty||lName.text.isEmpty||height.text.isEmpty||weight.text.isEmpty||day=="Day"){

            FlutterToastr.show("1 or Multiple Fields Missing", context);
          }
          else{
            AddToDB(fName.text, lName.text, gender, height.text, weight.text, int.parse(day), int.parse(month), int.parse(year));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BMRScreen(),));
          }







         })


            


        
            
            
            
              
           
          ],
        ),
        
      ),
    );
  }

  
}
