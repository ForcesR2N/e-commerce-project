import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  var name = "".obs;

  void changedTabIndex(int index) {
    selectedIndex.value = index;
  }

  void changedName(String newName) {
    name.value = newName;
  }
}
