import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmployeesSection extends StatefulWidget {
  final List<String> employees;

  EmployeesSection(this.employees);

  @override
  _EmployeesSectionState createState() => _EmployeesSectionState();
}

class _EmployeesSectionState extends State<EmployeesSection> {
  TextEditingController employeeNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double turns = 0.0;
  List<String> mainServices = ['THREADING & WAX', 'Facials & Bleach', 'Cuttings','Manicure/Pedicure','Makeup',];
  Map<String, List<String>> subServices = {
    'THREADING & WAX': ['Eyebrowz', 'Upper Lips', 'Forehead', 'Chin', 'Full Face Threading', 'Full Face Wax', 'Full Arms Wax', 'Half Arms Wax', 'Full Legs Wax', 'Half Legs Wax', 'Under Arms Wax', 'Bikini Wax',],
    'Facials & Bleach': ['Whitening Bleach', 'Full Arms Bleach', 'Full Legs Bleach', 'Zafrani Bleach', 'Fruit Facial', 'Zafrani Whitening Facial', 'Derma Shine Facial', 'Glamorous Facial', 'Dermastation Facial', 'Normal Cleansing Face Polish', 'Whitening Facial', '(Golden Pearl, Arfa) Gold Facial', 'Zafrani Facial', 'Golden Zafrani',],
    'Cuttings': [ 'Trimming', 'Puff Cutting', 'Front Layer Cut Full Layer Cut', 'Full Step Cut', 'Half Step Cut', 'Bob Cut', 'Bangs Cut', 'Baby Cut', 'U Cut', 'V Cut',],
    'Manicure/Pedicure': ['Manicure', 'Pedicure', 'Zafrani Manicure', 'Zafrani Pedicure', 'Dermastation Manicure', 'Dermastation Pedicure',],
    'Makeup': ['Party Makeup', 'Model Makeup', 'Engagement Makeup', 'Mayoon Makeup', 'Bridal Package',]
  };
  String? selectedMainService;
  String? selectedSubService;
  List<String> selectedServices = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 350),
            Text(
              'Employees',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: 10),
            Column(
              children:
                  widget.employees.map((employee) => Text(employee,style: TextStyle(fontSize: 20, color: Colors.white),)).toList(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
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
                        controller: employeeNameController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Name is Empty';
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'Employee',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child:
                                  SvgPicture.asset('assets/icons/employee.svg'),
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
                        setState(() {
                          widget.employees.add(employeeNameController.text);
                          employeeNameController.clear();
                        });
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
            SizedBox(height: 20), // Add spacing
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: selectedServices.map((service) {
                return Text(service,style: TextStyle(fontSize: 20, color: Colors.white),);
              }).toList(),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                child: DropdownButtonFormField<String>(
                  value: selectedMainService,
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Select Main Service'),
                  ),
                  items: mainServices.map((mainService) {
                    return DropdownMenuItem<String>(
                      value: mainService,
                      child: Text(mainService),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedMainService = value;
                      selectedSubService = null; // Reset sub-service when changing main service
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            if (selectedMainService != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                  child: DropdownButtonFormField<String>(
                    value: selectedSubService,
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('Select Sub-Service'),
                    ),
                    items: subServices[selectedMainService!]!.map((subService) {
                      return DropdownMenuItem<String>(
                        value: subService,
                        child: Text(subService),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none)
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedSubService = value;
                      });
                    },
                  ),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedMainService != null && selectedSubService != null) {
                  setState(() {
                    selectedServices.add('$selectedMainService - $selectedSubService');
                    selectedMainService = null;
                    selectedSubService = null;
                  });
                }
              },
              child: Text('Add Service'),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    employeeNameController.dispose();
    super.dispose();
  }
}
