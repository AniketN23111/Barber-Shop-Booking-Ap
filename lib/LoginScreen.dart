import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      return user;
    } catch (error) {
      print(error);
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
                  if (user != null) {
                    // Navigate to your main screen or do something with the user
                    // after successful Google sign-in.
                  }
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
                    Navigator.pushNamed(context, 'homePage');
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