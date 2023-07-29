import 'package:get/get.dart';

import 'manage_controller.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(ManageController());
  }
}
