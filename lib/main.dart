import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saloon/Get%20Started/getStarted.dart';
import 'package:saloon/LoginScreen.dart';
import 'package:saloon/otp_screen.dart';
import 'package:saloon/splash_screen.dart';
import 'package:saloon/home_page.dart';
import 'package:saloon/phone_login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => SplashScreen(),
      'loginScreen':(context) => LoginScreen(),
      'getStarted':(context)=>GetStarted(),
      'homePage': (context) => HomePage(),
      'phoneLogin': (context) => phonelogin(),
      'otp': (context) => Otp_Screen(),
    },
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Color.fromRGBO(18, 26, 18, 1),
      scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
    ),
  )
  );
}