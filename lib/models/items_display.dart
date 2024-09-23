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
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(sneaker.mainPictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Text(
            sneaker.name ?? 'Unnamed Product',
            maxLines: 2,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price: \$${(sneaker.retailPriceCents ?? 0) / 100}", 
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
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
