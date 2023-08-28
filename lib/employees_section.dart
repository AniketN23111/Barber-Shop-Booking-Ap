import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saloon/main.dart';
class EmployeesSection extends StatefulWidget {
  final List<String> employees;
  EmployeesSection(this.employees);
  @override
  _EmployeesSectionState createState() => _EmployeesSectionState();
}

class _EmployeesSectionState extends State<EmployeesSection> {
  TextEditingController employeeNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isClicked = false;
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 550),
          Text(
            'Employees',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Column(
            children:
            widget.employees.map((employee) => Text(employee)).toList(),
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
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    employeeNameController.dispose();
    super.dispose();
  }
}
