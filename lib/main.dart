import 'package:e_commerce_project/pages/home.dart';
import 'package:e_commerce_project/pages/home_page.dart';
import 'package:e_commerce_project/pages/login_or_register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
