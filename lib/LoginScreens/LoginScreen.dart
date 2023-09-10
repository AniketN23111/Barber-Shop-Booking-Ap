import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saloon/AdditionalInfo.dart';
import 'package:saloon/HomeScreen/HomePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final List<String> images = [
    'assets/images/Men.jpg',
    'assets/images/Spa.jpg',
    'assets/images/Parlour.jpg',
  ];
  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }
  void _startAutoPlay() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      _startAutoPlay();
    });
  }

  Future<User?> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Check if the user already exists in Firebase
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        // Check if the user exists in your Firestore database (adjust collection and field names accordingly)
        final userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userSnapshot.exists) {
          // The user is registered, so navigate to the home page
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user: user)));
        } else {
          // The user is not registered, so navigate to the additional info screen
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionalInfoScreen(user: user)));
        }
      }

      return user; // Return the user here
    } catch (error) {
      print(error);
      // Handle the error appropriately
      return null;
    }
  }

  Future<void> _handlePhoneSignIn() async {
    // Implement phone number sign-in using Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 120),
            Container(
              width: double.infinity,height: 300,
              child: Expanded(
                flex: 1,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Image.asset(
                      images[i],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: SvgPicture.asset(
                  'assets/icons/google-color-svgrepo-com.svg',height: 20,),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50)
              ),
                onPressed: () async {
                  final User? user = await _handleGoogleSignIn();
                },
                label: Text('Login with Google'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: SvgPicture.asset(
                  'assets/icons/phone-svgrepo-com.svg',height: 20,),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50)
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'phoneLogin');
                  // Implement phone number sign-in using Firebase
                },
                label: Text('Login with Phone'),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account? "),
                TextButton(
                  onPressed: () {
                    // Handle the Sign Up action here
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Want to be a partner? "),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'partner-page');
                  },
                  child: Text('Click here'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}