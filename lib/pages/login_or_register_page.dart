import 'package:e_commerce_project/component/button_login_register.dart';
import 'package:e_commerce_project/component/my_color.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("lib/image/icon_first_page.png"),
            ButtonLoginRegister(text: "Im new, sign me up", onPress: () {}),
            SizedBox(
              height: 14,
            ),
            ButtonLoginRegister(text: "Login", onPress: () {})
          ],
        ),
      ),
    );
  }
}
