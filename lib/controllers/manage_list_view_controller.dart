import 'package:get/get.dart';

class ManageListViewController extends GetxController{

  final rowSpan = 5;
  final rowSpacing = 4.0;
  final overAllPadding = 16.0;

  late final double _width;
  double get width => _width;

  @override
  void onInit() {
    super.onInit();
    _width = (Get.width - (overAllPadding * 2) - (rowSpan*rowSpacing)) / rowSpan;
  }
}