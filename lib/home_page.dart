import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saloon/employees_section.dart';
import 'package:saloon/owner.dart';
import 'package:saloon/shop_details.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> employees = [];

  PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  void navigateToPage(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.grey.shade200,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index){
          navigateToPage(index);
        },
        index: currentIndex,
        items: [
          SvgPicture.asset('assets/icons/user-svgrepo-com.svg', width: 30, height: 30),
          SvgPicture.asset('assets/icons/shop.svg', width: 30, height: 30),
          SvgPicture.asset('assets/icons/employee.svg', width: 30, height: 30),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
         color: Colors.white70,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
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
