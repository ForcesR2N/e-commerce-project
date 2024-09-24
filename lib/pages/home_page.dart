import 'package:e_commerce_project/controller/bottom_navbar_controller.dart';
import 'package:e_commerce_project/pages/cart_page.dart';
import 'package:e_commerce_project/pages/home.dart';
import 'package:e_commerce_project/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.find();

    final List<Widget> menus = [
      Home(),
      CartPage(),
      ProfilePage(
        username: 'Rizal',
      ),
    ];

    return Obx(
      () {
        return Scaffold(
          body: menus[bottomNavController.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavController.selectedIndex.value,
            onTap: bottomNavController.changedTabIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"), 
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: "My Cart"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
