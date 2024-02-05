import 'package:flutter/material.dart';
import 'package:my_trainer/components/logoImage.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninState();
}

class _SigninState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: logoImage()),
          Text(
            "Login",
            style: TextStyle(
                fontFamily: 'Lemonmilk',
                fontSize: 35,
                color: Color.fromRGBO(255, 0, 0, 1)),
          )
        ],
      ),
    );
  }
}
