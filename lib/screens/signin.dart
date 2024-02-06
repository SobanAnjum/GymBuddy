// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
final _formkey= GlobalKey<FormState>();
class _SigninState extends State<SigninScreen> {
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
              "Login",
              style: TextStyle(
                  fontFamily: 'Lemonmilk',
                  fontSize: 35,
                  color: Color.fromRGBO(255, 0, 0, 1)),
            )
          ,const SizedBox(height: 50,)
          ,textFormField("Username", 'username', false,Icons.person)
          ,const SizedBox(height: 20)
          ,textFormField("Password", 'password', true,Icons.lock_outline_rounded)
          ,const SizedBox(height: 80)
          ,loginSignupBTN("Login",(){}),
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
