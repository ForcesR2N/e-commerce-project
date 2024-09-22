import 'package:e_commerce_project/models/items.dart';
import 'package:e_commerce_project/service/get_controller.dart';
import 'package:e_commerce_project/widget/image_slider.dart';
import 'package:e_commerce_project/widget/search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final ProductController productController = Get.put(ProductController());
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSlider = 0;
  int selectedIndex = 0;
  bool _isNotificationActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nice Store"),
        actions: [
          IconButton(
            icon: Icon(_isNotificationActive
                ? Icons.notifications_active
                : Icons.notifications_off),
            onPressed: () {
              setState(
                () {
                  _isNotificationActive = !_isNotificationActive;
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(),
              SizedBox(height: 18),
              ImageSlider(
                currentSlider: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              if (selectedIndex == 0)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              Obx(() {
                if (widget.productController.productItems.isEmpty) {
                  return const Center(
                    child:
                        CircularProgressIndicator(), // Show loader when no data
                  );
                } else {
                  return SizedBox(
                    height: 500, // Set a fixed height for GridView
                    child: GridView.builder(
                      itemCount: widget.productController.productItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75, // Adjust aspect ratio for items
                      ),
                      itemBuilder: (context, index) {
                        final product =
                            widget.productController.productItems[index];
                        return ProductItemDisplay(sneaker: product);
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItemDisplay extends StatelessWidget {
  final Sneaker sneaker;

  const ProductItemDisplay({super.key, required this.sneaker});

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
            sneaker.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Price: \$${(sneaker.retailPriceCents ?? 0) / 100}",
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
