import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saloon/AdditionalInfo.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while fetching data
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            // No user data available, handle navigation here
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, 'getStarted');
            });
            return Container(); // Return an empty container for now
          }

          // Extract user data from Firestore
          Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
          String firstName = '${userData['firstName']}';
          String lastName = ' ${userData['lastName']}';
          String email = userData['email'];
          String dob = userData['dob'];
          String mobile = userData['mobile'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First Name: $firstName'),
              Text('Last Name: $lastName'),
              Text('Email: $email'),
              Text('Date of Birth: $dob'),
              Text('Mobile Number: $mobile'),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 'loginScreen');
                },
                child: Text('Logout'),
              ),
            ],
          );
        },
      ),
    );
  }
}
