import 'package:e_commerce_project/models/items.dart';
import 'package:get/get.dart';

class SelectedProductsController extends GetxController {
  var selectedProducts = <Sneaker>[].obs;

  void addProduct(Sneaker product) {
    if (product != null) {
      selectedProducts.add(product);
    } else {
      print("null product.");
    }
  }

  void removeProduct(Sneaker product) {
    selectedProducts.remove(product);
  }
}
