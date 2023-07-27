import 'package:drape/controllers/closet_controller.dart';
import 'package:drape/helpers/store.dart';
import 'package:get/get.dart';

class FilterLayoutController extends GetxController {
  final ClosetController closetController = Get.find();

  FilterLayoutController() {
    _selectedFilters.value = closetController.appliedFilters
        .map((key, value) => MapEntry(key, RxList<String>.of(value)));
  }

  final Map<String, List<String>> filters = {
    "type": Store.typeList,
    "occasion": Store.occasionList,
  };

  final RxMap<String, RxList<String>> _selectedFilters = {
    "type": <String>[].obs,
    "occasion": <String>[].obs,
  }.obs;

  onSelected(String key, String value, bool isSelected) {
    if (isSelected) {
      _selectedFilters[key]?.add(value);
    } else {
      _selectedFilters[key]?.remove(value);
    }
  }

  isSelected(String key, String value) =>
      _selectedFilters[key]?.contains(value);

  onClickApply() {
    closetController.appliedFilters.value = _selectedFilters;
    Get.back();
  }

  onClickClear() {
    _selectedFilters.value = {
      "type": <String>[].obs,
      "occasion": <String>[].obs,
    };
  }

  onClickClose() {
    Get.back();
  }
}
