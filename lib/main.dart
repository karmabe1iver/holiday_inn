import 'package:flutter/material.dart';
import 'package:holiday_inn/screens/splash%20screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Aadhar Scanner',

      initialRoute: '/',
      routes: {
        '/':(context)=> SplashScreen1()
      },
    );
  }
}

