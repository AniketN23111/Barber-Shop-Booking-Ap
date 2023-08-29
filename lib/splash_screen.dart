import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/shopDetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(height: 300),
              Center(
                child: Lottie.network(
                    'https://lottie.host/662e5090-cd57-48ed-bac8-64c1653f5116/BTknOyOUY1.json'),
              ),
              SizedBox(height: 20),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 40.0, fontFamily: 'Shrikhand'),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('Salon'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
