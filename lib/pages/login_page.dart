import 'package:e_commerce_project/component/button_login_register.dart';
import 'package:e_commerce_project/component/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/image/icon_first_page.png"),
            SizedBox(height: 50),
            ButtonLoginRegister(
              text: "Get Started",
              onPress: () {
                Get.toNamed('/loginOrRegister');
              },
            ),
          ],
        ),
      ),
    );
  }
}
