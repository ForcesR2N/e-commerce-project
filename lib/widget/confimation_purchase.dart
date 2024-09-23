import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/component/my_color.dart';
import 'package:e_commerce_project/models/items.dart';

// Helper function for the confirmation dialog
void showConfirmationDialog(BuildContext context, VoidCallback onAdd, Sneaker sneaker) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Purchase"),
        content: const Text("Are you sure you want to add this item to your cart?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog without adding to cart
            },
          ),
          ElevatedButton(
            child: const Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onAdd(); // Add item to cart

              // Show Snackbar after adding to cart
              Get.snackbar(
                "Added to Cart",
                "${sneaker.name ?? 'Product'} has been added to your cart", // Null safety for product name
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
