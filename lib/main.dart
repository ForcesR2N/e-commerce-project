import 'package:e_commerce_project/bindings/bind_bottomNavBar.dart';
import 'package:e_commerce_project/pages/home_page.dart';
import 'package:e_commerce_project/pages/login_or_register_page.dart';
import 'package:e_commerce_project/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginPage',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginOrRegisterPage(),
        ),
        GetPage(
            name: '/loginPage',
            page: () => const LoginPage(),
            binding: BindBottomnavbar()),
        GetPage(
            name: '/homePage',
            page: () => const HomePage(),
            binding: BindBottomnavbar()),
        GetPage(
            name: '/loginOrRegister', page: () => LoginOrRegisterPage()),
      ],
    );
  }
}
