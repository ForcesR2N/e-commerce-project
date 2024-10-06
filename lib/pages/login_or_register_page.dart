import 'package:e_commerce_project/controller/bottom_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/component/button_login_register.dart';
import 'package:e_commerce_project/component/my_color.dart';

class LoginOrRegisterPage extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());
  LoginOrRegisterPage({super.key});

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'rizal' && password == '2727') {
      Get.toNamed('/homePage');
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

  void _handleRegister() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      Get.toNamed('/homePage');
    } else {
      Get.snackbar(
        "Registration Failed",
        "Please provide a valid username and password.",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/image/icon_first_page.png"),
              const SizedBox(height: 20),
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
                onChanged: (value) {
                  controller.changedName(value);
                },
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
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
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ButtonLoginRegister(
                text: "Login",
                onPress: _handleLogin,
                bgButton: Colors.blue,
                txtColor: Colors.white,
                outlineColor: Colors.transparent,
              ),
              const SizedBox(height: 14),
              ButtonLoginRegister(
                text: "Create new account",
                onPress: _handleRegister,
                bgButton: Colors.green,
                txtColor: Colors.white,
                outlineColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
