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

  String getEmptyState(option){
    switch(option){
      case "fresh" : return "Shows newly laundered or unworn clothes";
      case "hanger" : return "Shows clothes that have been worn and are still suitable for a few more uses";
      case "basket" : return "Shows clothes that require washing";
      default : return "";
    }
  }
}