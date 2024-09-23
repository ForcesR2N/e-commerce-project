import 'package:e_commerce_project/component/my_color.dart';
import 'package:e_commerce_project/controller/selected_product.dart';
import 'package:e_commerce_project/models/items_display.dart';
import 'package:e_commerce_project/service/get_controller.dart';
import 'package:e_commerce_project/widget/image_slider.dart';
import 'package:e_commerce_project/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final ProductController productController = Get.put(ProductController());
  final SelectedProductsController selectedProductsController =
      Get.put(SelectedProductsController());
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
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          "NICE STORE",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _isNotificationActive
                  ? Icons.sports_baseball_rounded
                  : Icons.sports_handball_outlined,
              color: Colors.white,
              size: 35,
            ),
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
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 500,
                    child: GridView.builder(
                      itemCount: widget.productController.productItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final product =
                            widget.productController.productItems[index];
                        return ProductItemDisplay(
                          sneaker: product,
                          onAdd: () {
                            widget.selectedProductsController
                                .addProduct(product);
                          },
                        );
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
