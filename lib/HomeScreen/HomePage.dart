import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String fullName;
  final String email;
  final String dob;
  final String mobile;

  HomePage({
    required this.fullName,
    required this.email,
    required this.dob,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Full Name: $fullName'),
            Text('Email: $email'),
            Text('Date of Birth: $dob'),
            Text('Mobile Number: $mobile'),
          ],
        ),
      ),
    );
  }
}
