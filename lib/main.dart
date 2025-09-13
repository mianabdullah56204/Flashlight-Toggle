import 'package:flutter/material.dart';
import 'package:flashlight_toggle/flashlight_screen.dart';

void main() {
  runApp(const FlashlightApp());
}

class FlashlightApp extends StatelessWidget {
  const FlashlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flashlight App",
      home: FlashlightScreen(),
    );
  }
}
