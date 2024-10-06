import 'package:flutter/material.dart';
import 'package:e_commerce_project/component/my_color.dart';

class ButtonLoginRegister extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double width;
  final double height;
  final Color bgButton;
  final Color txtColor;
  final Color outlineColor;

  const ButtonLoginRegister({
    super.key,
    required this.text,
    this.width = 400.0,
    this.height = 50.0,
    this.bgButton = AppColor.bgNomorHp,
    this.txtColor = Colors.black,
    this.outlineColor = Colors.transparent,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: outlineColor, width: 1.3),
          foregroundColor: txtColor,
          backgroundColor: bgButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 1,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
