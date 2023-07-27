import 'dart:io';

import 'package:drape/helpers/image_preprocessor.dart';
import 'package:drape/routes/detail_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../helpers/os_worker.dart';
import '../main.dart';
import '../model/item.dart';

class ClosetController extends GetxController {
  final available = ["Shorts", "Shoe", "Shirt"];

  var items = <Item>[];
  var filteredItems = <Item>[].obs;

  RxBool hasFiltersApplied = false.obs;

  RxMap<String, RxList<String>> appliedFilters = {
    "type": <String>[].obs,
    "occasion": <String>[].obs,
  }.obs;

  final scrollController = ScrollController();
  final isFabVisible = true.obs;

  ClosetController() {
    getItems();
    appliedFilters.listen((filters) {
      applyFiltersTemp(filters);
    });
    scrollController.addListener(() {
      isFabVisible.value = scrollController.hasClients &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.forward;
    });
  }

  getItems({String condition = "", dynamic args}) async {
    final list = await databaseProvider.itemExecutor
        .read(condition: condition, args: args);
    items = list;
    filteredItems.value = list;
  }

  onClickAddClothing() async {
    final List<XFile> images = await openImagesPicker();
    final directory = await getApplicationDocumentsDirectory();

    final futures = images.map((image) async {
      String label = await labelImage(File(image.path));
      String imagePath = await storeImage(directory, image);
      final item = await databaseProvider.itemExecutor.add(
        Item(image: imagePath, name: label),
      );
      return item;
    });

    final newItems = await Future.wait(futures);
    items.addAll(newItems);
    applyFiltersTemp(appliedFilters);
  }

  onItemSelected(item) async {
    final shouldUpdate = await Get.to<bool>(
      () => ItemDetail(),
      arguments: item,
    );
    if (shouldUpdate == true) {
      getItems();
    }
  }

  deleteItem(int id) {
    databaseProvider.itemExecutor.remove(id);
    Fluttertoast.showToast(msg: "Item Deleted");
    getItems();
  }

  applyFiltersTemp(filters) {
    final typeList = appliedFilters["type"];
    final occasionList = appliedFilters["occasion"];
    hasFiltersApplied.value = typeList!.isNotEmpty || occasionList!.isNotEmpty;
    filteredItems.value = items.where((item) {
      var type = true;
      var occasion = true;
      if (typeList.isNotEmpty) {
        type = typeList.contains(item.type);
      }
      if (occasionList!.isNotEmpty) {
        occasion = occasionList.contains(item.occasion);
      }
      return type && occasion;
    }).toList();
  }
}
