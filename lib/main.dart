import 'package:flutter/material.dart';
import 'package:saloon/splash_screen.dart';
import 'package:saloon/home_page.dart'; // Update the import statement

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/shopDetails': (context) => HomePage(), // New route
      },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color.fromRGBO(18, 26, 18, 1),
        scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }
}
