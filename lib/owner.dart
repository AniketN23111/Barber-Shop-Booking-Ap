import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saloon/main.dart';
import 'package:saloon/shop_details.dart';

class Owner extends StatefulWidget {
  @override
  _OwnerState createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _mNumber = TextEditingController();
  TextEditingController _aadhar = TextEditingController();
  TextEditingController _pan = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 550),
            Text(
              'Owner Details',
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Flexible(
                    flex :1,
                    child: Container(
                      height: 50,
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _firstname,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Name is Empty';
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'FirstName',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child:
                              SvgPicture.asset('assets/icons/user-svgrepo-com.svg'),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex :1,
                    child: Container(
                      height: 50,
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _lastname,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Name is Empty';
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Last Name',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child:
                              SvgPicture.asset('assets/icons/user-svgrepo-com.svg'),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 70,
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
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2)
                        ],

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(15),
                            hintText: '+91',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Container(
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
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        controller: _mNumber,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Name is Empty';
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Mobile Number',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(9),
                              child: SvgPicture.asset(
                                  'assets/icons/phone-svgrepo-com.svg'),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                //width: 50,
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _email,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Name is Empty';
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Email',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9),
                        child: SvgPicture.asset(
                            'assets/icons/email-1-svgrepo-com.svg'),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                //width: 50,
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
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _aadhar,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Name is Empty';
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Aadhaar Number',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9),
                        child: SvgPicture.asset(
                            'assets/icons/user-id-svgrepo-com.svg'),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                //width: 50,
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
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _pan,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Name is Empty';
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Pan Card',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9),
                        child: SvgPicture.asset(
                            'assets/icons/address-card-svgrepo-com.svg'),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                }
              },
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1),
                    const BoxShadow(
                        color: Colors.white,
                        offset: const Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/plus-svgrepo-com.svg',
                  width: 10,
                  height: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}