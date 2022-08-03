import 'package:flutter/material.dart';
import 'package:parallax_effect_real/parallax_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParallaxScreen(),
    );
  }
}


