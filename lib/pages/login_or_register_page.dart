import 'package:e_commerce_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/component/button_login_register.dart';
import 'package:e_commerce_project/component/my_color.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle Login/Register
  void _handleLoginOrRegister() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'rizal' && password == '2727') {
      // Use Get.toNamed for a temporary check
      Get.toNamed('/homePage'); // Navigate to home page
    } else {
      Get.snackbar(
        "Login Failed",
        "Invalid username or password.",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor, // Use your custom color here
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or Icon
              Image.asset("lib/image/icon_first_page.png"),

              const SizedBox(height: 20),

              // Username Input Field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 20),

              // Password Input Field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true, // Hide the password
                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 20),

              // Login/Register Button
              ButtonLoginRegister(
                text: "Login or Register",
                onPress:
                    _handleLoginOrRegister, // Call the function to handle login/register
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}
