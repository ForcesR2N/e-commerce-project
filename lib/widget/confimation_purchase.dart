import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/component/my_color.dart';
import 'package:e_commerce_project/models/items.dart';

void showConfirmationDialog(
    BuildContext context, VoidCallback onAdd, Sneaker sneaker) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.secondaryColor,
        title: const Text(
          "Confirm Purchase",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        content: const Text(
          "Are you sure you want to add this item to your cart?",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: const Text(
              "Yes",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onAdd();
              Get.snackbar(
                "Added to Cart",
                "Product has been added to your cart",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColor.primaryColor.withOpacity(0.8),
                colorText: Colors.white,
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                duration: const Duration(seconds: 2),
                titleText: const Text(
                  "Added to Cart",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                messageText: const Text(
                  "Product has been added to your cart",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
