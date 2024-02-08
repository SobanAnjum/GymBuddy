// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get.dart';
import 'package:my_trainer/Functions/emailvalidator.dart';
import 'package:my_trainer/Functions/signinfirebase.dart';
import 'package:my_trainer/Functions/textvalidator.dart';
import 'package:my_trainer/components/formfield.dart';
import 'package:my_trainer/components/loginButton.dart';
import 'package:my_trainer/components/logoImage.dart';
import 'package:my_trainer/screens/registerpage.dart';
import 'package:my_trainer/screens/splash.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninState();
}

class _SigninState extends State<SigninScreen> {
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100,),
            Center(child: logoImage()),
            const SizedBox(height: 10,),
            const Text(
              "Login",
              style: TextStyle(
                  fontFamily: 'Lemonmilk',
                  fontSize: 35,
                  color: Color.fromRGBO(255, 0, 0, 1)),
            )
          ,const SizedBox(height: 50,)
          ,textFormField("Email", 'Email', false,Icons.mail,emailcontroller)
          ,const SizedBox(height: 20)
          ,textFormField("Password", 'password', true,Icons.lock_outline_rounded,passwordcontroller)
          ,const SizedBox(height: 80)
          ,loginSignupBTN("Login",(){
            

            signinBtnPress(emailcontroller.text,passwordcontroller.text,context);
            emailcontroller.clear();
            passwordcontroller.clear();
             }),
          const SizedBox(height: 20,),
           InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
            },
            child: const Text("Don't have an Account? Click here to Register"),
          )
          ],
        ),
      ),
    );
  }
}

signinBtnPress(String email,String password, BuildContext currentcontext) {
  if(email_Valid(email)&&text_Valid(password)){
     signinUser(email, password,currentcontext);
    return true;


  }else if(!email_Valid(email)&&!text_Valid(password)){
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
      return false;
  }

}