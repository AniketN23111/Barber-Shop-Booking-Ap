import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saloon/timepickerbutton.dart';

class ShopDetails extends StatefulWidget {
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  TextEditingController _shopname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _licence = TextEditingController();
  bool isEleveted = false;

  // TextEditingController _pincode=TextEditingController();

  List<String> states = ['Maharashtra', 'State 2', 'State 3']; // Example states
  List<String> countries = [
    'India',
    'Country 2',
    'Country 3'
  ]; // Example countries
  List<String> cities = ['Pune', 'City 2', 'City 3']; // Example cities

  String selectedState = 'Maharashtra'; // Default state
  String selectedCountry = 'India'; // Default country
  String selectedCity = 'Pune';
  List<bool> workingDays = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ]; // Monday-Sunday

  TimeOfDay startTime = TimeOfDay(hour: 9, minute: 0); // Default start time
  TimeOfDay endTime = TimeOfDay(hour: 18, minute: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 550),
          Text(
            "Shope Details",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
                keyboardType: TextInputType.text,
                controller: _shopname,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Name is Empty';
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Shop Name',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/Icons/shop.svg'),
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
                controller: _address,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Name is Empty';
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Address',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(9),
                      child: SvgPicture.asset(
                          'assets/icons/address-location-map-svgrepo-com (1).svg'),
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
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6)
                ],
                controller: _pincode,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Name is Empty';
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Pin code',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(9),
                      child: SvgPicture.asset(
                          'assets/icons/address-location-map-svgrepo-com (1).svg'),
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
            child: Row(
              children: [
                Flexible(
                  flex: 1, // Adjust flex values as needed
                  child: DropdownButtonFormField<String>(
                    value: selectedCity,
                    items: cities.map((city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'City',
                      prefixIcon: Icon(Icons.location_city),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 2, // Adjust flex values as needed
                  child: DropdownButtonFormField<String>(
                    value: selectedState,
                    items: states.map((state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedState = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'State',
                      prefixIcon: Icon(Icons.location_on),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: DropdownButtonFormField<String>(
              value: selectedCountry,
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Country',
                prefixIcon: Icon(Icons.public),
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
                keyboardType: TextInputType.text,
                controller: _licence,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Name is Empty';
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Shop License',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/Icons/license.svg'),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Working Days:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 8.1,
                      childAspectRatio: 6.1,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: workingDays[index],
                            onChanged: (value) {
                              setState(() {
                                workingDays[index] = value!;
                                if (index == 0) {
                                  for (int i = 1; i < 8; i++) {
                                    workingDays[i] = value;
                                  }
                                }
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                          Text(getDayName(index)),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 120),
            child: Row(
              children: [
                Expanded(
                  child: TimePickerButton(
                    label: 'Start Time',
                    selectedTime: startTime,
                    onChanged: (time) {
                      setState(() {
                        startTime = time;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TimePickerButton(
                    label: 'End Time',
                    selectedTime: endTime,
                    onChanged: (time) {
                      setState(() {
                        endTime = time;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String getDayName(int index) {
  return ['All', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
}
