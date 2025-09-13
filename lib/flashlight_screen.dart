import 'package:flutter/material.dart';

class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  State<FlashlightScreen> createState() => _FlashlightScreenState();
}

class _FlashlightScreenState extends State<FlashlightScreen>
    with SingleTickerProviderStateMixin {
  bool isOn = false;
  double iconSize = 100;

  void toggleFlashlight() {
    setState(() {
      isOn = !isOn;
      iconSize = 120;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        iconSize = 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFlashlight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: isOn ? Colors.white : Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: isOn
                      ? [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.8),
                            blurRadius: 50,
                            spreadRadius: 20,
                          ),
                        ]
                      : [],
                ),
                child: AnimatedSize(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: Icon(
                    isOn ? Icons.flashlight_on : Icons.flashlight_off,
                    size: iconSize,
                    color: isOn ? Colors.yellow[700] : Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                isOn ? "Flashlight ON" : "Flashlight OFF",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isOn ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
