import 'package:get/get.dart';
import 'package:e_commerce_project/controller/bottom_navbar_controller.dart';
import 'package:http/http.dart';

class BindBottomnavbar extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }
}
