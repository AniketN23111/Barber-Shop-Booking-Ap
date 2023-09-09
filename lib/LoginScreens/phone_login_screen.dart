import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class phonelogin extends StatefulWidget {
  const phonelogin({super.key});

  static String verify="";
  @override
  State<phonelogin> createState() => _phoneloginState();
}

class _phoneloginState extends State<phonelogin> {
  TextEditingController countrycode=TextEditingController();
  var phone="";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState(){
    countrycode.text="+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Parlour.jpg',
              width: 150,height: 150
              ),
              SizedBox(height: 20),
              Text('Phone Verification',style: TextStyle(
                fontSize: 22,fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 20),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff1D1617).withOpacity(0.11),
                        blurRadius: 40,
                        spreadRadius: 0.0)
                  ],
                  color: Color.fromRGBO(247, 247, 249, 1),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countrycode,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                    ),
                    SizedBox(width: 10),
                    Text('|',style: TextStyle(
                      fontSize: 33,
                      color: Colors.grey
                    ),),
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          onChanged: (value){
                            phone=value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text + phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      phonelogin.verify=verificationId;
                      Navigator.pushNamed(context, 'otp');
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

                },
                    child: Text('Send the Code'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
