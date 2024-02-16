import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/firebase_options.dart';
import 'package:my_trainer/providerclasses/muscleDataprovider.dart';
import 'package:my_trainer/screens/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:DefaultFirebaseOptions.currentPlatform,
          );
  runApp( MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => MuscleData(),)],
        child: const MyApp()));
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
      home:const SplashScreen());
  }
}
//OnBoardingScreen