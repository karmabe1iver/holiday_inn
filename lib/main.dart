import 'package:flutter/material.dart';
import 'package:holiday_inn/screens/denied/denied.dart';
import 'package:holiday_inn/screens/guest%20details/guest_details.dart';
import 'package:holiday_inn/screens/splash%20screen/splash_screen.dart';
import 'package:holiday_inn/screens/sucess/sucess_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/':(context)=> SplashScreen1(),
        'guest detail':(context)=>GuestDetails(),
        //'denied':(context)=>Denied(res),
        'sucess':(context)=>SucessScreen(),
      },
    );
  }
}

