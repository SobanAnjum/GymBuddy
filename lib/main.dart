import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAfxqp6uAQ_L6dCP9r1QxtuXzfppsxqc5o",
          appId: "1:838242850038:android:7242f8c4a20212d47c48d7",
          messagingSenderId: '838242850038',
          projectId: 'gymbuddy-4baca'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 18, 20, 32),
      ),
      home: SplashScreen(),
    );
  }
}
