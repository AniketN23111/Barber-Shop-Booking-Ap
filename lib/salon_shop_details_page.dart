import 'package:flutter/material.dart';
import 'package:saloon/employees_section.dart';
import 'package:saloon/owner.dart';
import 'package:saloon/shop_details.dart';

class SalonShopDetailsPage extends StatelessWidget {
  List<String> employees = [];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Owner();
                  } else if (index == 1) {
                    return ShopDetails();
                  } else {
                    return EmployeesSection(employees);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
