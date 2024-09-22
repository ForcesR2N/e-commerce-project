import 'package:e_commerce_project/models/items.dart';
import 'package:e_commerce_project/service/service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productItems = <Sneaker>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      var product = await RemoteService.fetchProduct();
      if (product != null) {
        productItems.assignAll(product.sneakers);
      }
    } catch (e) {
      print("error fetching products : $e");
    }
  }
}
