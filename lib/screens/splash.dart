import 'package:flutter/material.dart';
import 'package:my_trainer/components/logoImage.dart';
import 'package:my_trainer/screens/signin.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => SigninScreen()));
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: logoImage()), logoTextMain(), logoTextSub()],
      ),
    );
  }
}

Widget logoTextMain() {
  return Text(
    "GYMBUDDY",
    style: TextStyle(fontFamily: "Lemonmilk", fontSize: 40),
  );
}

Widget logoTextSub() {
  return Text(
    "Your Guide to fitness",
    style: TextStyle(
        color: Color.fromRGBO(255, 0, 0, 1),
        fontSize: 15,
        fontFamily: 'Lemonmilk'),
  );
}