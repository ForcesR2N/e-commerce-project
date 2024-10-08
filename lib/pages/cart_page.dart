import 'package:e_commerce_project/component/my_color.dart';
import 'package:e_commerce_project/controller/selected_product.dart';
import 'package:e_commerce_project/models/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final SelectedProductsController selectedProductsController =
      Get.put(SelectedProductsController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (selectedProductsController.selectedProducts.isEmpty) {
          return Center(
            child: Text("Your cart is empty"),
          );
        } else {
          return ListView.builder(
            itemCount: selectedProductsController.selectedProducts.length,
            itemBuilder: (context, index) {
              final Sneaker sneaker =
                  selectedProductsController.selectedProducts[index];
              if (sneaker != null) {
                return ListTile(
                  leading: Image.network(
                    sneaker.mainPictureUrl,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text("\$${sneaker.name ?? 'Unnamed Product'}"),
                  subtitle: Text("\$${(sneaker.retailPriceCents ?? 0) / 100}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      selectedProductsController.removeProduct(sneaker);
                    },
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          );
        }
      }),
    );
  }
}
