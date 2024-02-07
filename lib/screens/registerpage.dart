// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get.dart';
import 'package:my_trainer/Functions/emailValidator.dart';
import 'package:my_trainer/Functions/signinfirebase.dart';
import 'package:my_trainer/Functions/signupfirebase.dart';
import 'package:my_trainer/Functions/textvalidator.dart';
import 'package:my_trainer/components/formfield.dart';
import 'package:my_trainer/components/loginButton.dart';
import 'package:my_trainer/components/logoImage.dart';
import 'package:my_trainer/screens/homepage.dart';
import 'package:my_trainer/screens/signin.dart';
import 'package:my_trainer/screens/splash.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _SigninState();
}

class _SigninState extends State<RegisterPage> {


  TextEditingController emailcontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController usernamecontroller= TextEditingController();


//   checkUser(){
//   final user = FirebaseAuth.instance.currentUser;
//   if(user!=null){
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

//   }
//   else{
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150,),
         
            Center(child: logoImage()),
            const SizedBox(height: 10,)
            ,const Text(
              "Register",
              style: TextStyle(
                  fontFamily: 'Lemonmilk',
                  fontSize: 35,
                  color: Color.fromRGBO(255, 0, 0, 1)),
            )
          ,const SizedBox(height: 50,)
            ,textFormField("Email", 'email', false,Icons.mail_outline,emailcontroller)
          ,const SizedBox(height: 20)
          ,textFormField("Username", 'username', false,Icons.person,usernamecontroller)
          ,const SizedBox(height: 20)
          ,textFormField("Password", 'password', true,Icons.lock_outline_rounded,passwordcontroller)
          ,const SizedBox(height: 80)
          ,loginSignupBTN("Register",(){

            signinBtnPress(emailcontroller.text,passwordcontroller.text,context);
            
            }),
          const SizedBox(height: 20,),
           InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
              



            },



            child: const Text("Already have an Account? Click here to Login"),
          

          )
        
          ],
        ),
      ),
    );
  }
}
signinBtnPress(String email,password,BuildContext currentcontext) {
 if(email_Valid(email)&&text_Valid(password)){
    signupUser(email, password,currentcontext);

  }
  else if(!email_Valid(email)&&!text_Valid(password)){
    FlutterToastr.show("Invalid Email and Short Password", currentcontext);

  }
  else if(email_Valid(email)&&!text_Valid(password)){
    FlutterToastr.show("Password very short", currentcontext);

  }
  else if(!email_Valid(email)&&text_Valid(password)){
    FlutterToastr.show("Invalid Email", currentcontext);

  }
  else{
    FlutterToastr.show("Some Error Occured", currentcontext);
  }
  
}
