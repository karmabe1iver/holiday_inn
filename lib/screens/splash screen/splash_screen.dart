import 'dart:async';

import 'package:flutter/material.dart';
import 'package:holiday_inn/screens/scan/scan_page.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScanPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'asset/image/Splashscreen.png',
            fit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            'asset/image/holiday2.png',
          )
        ],
      ),
    );
  }
}
