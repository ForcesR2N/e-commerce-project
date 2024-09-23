import 'package:e_commerce_project/widget/confimation_purchase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/component/my_color.dart';
import 'package:e_commerce_project/models/items.dart';

class ProductItemDisplay extends StatelessWidget {
  final Sneaker sneaker;
  final VoidCallback onAdd;

  const ProductItemDisplay(
      {super.key, required this.sneaker, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(sneaker.mainPictureUrl ??
                    'https://via.placeholder.com/150'), // Fallback if image is null
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Product Name
          Text(
            sneaker.name ?? 'Unnamed Product', // Null safety for product name
            maxLines: 2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),

          // Price and Add to Cart Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price: \$${(sneaker.retailPriceCents ?? 0) / 100}", // Null safety for price
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),

              // Add to Cart Button
              SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    // Call the helper function to show the confirmation dialog
                    showConfirmationDialog(context, onAdd, sneaker);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
