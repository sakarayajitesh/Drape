import 'package:drape/main.dart';
import 'package:drape/model/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'laundry_list_view_controller.dart';

class LaundryController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late final String _querySql;

  final freshList = <Item>[].obs;
  final hangerList = <Item>[].obs;
  final basketList = <Item>[].obs;

  late final TabController tabController;

  late final List<String> _tabOptions;

  @override
  void onInit() {
    super.onInit();
    Get.put(LaundryListViewController());
    _tabOptions = ["Fresh", "Hanger", "Basket"];
    _querySql = '''SELECT i.*, COUNT(o.id) AS worn_count
    FROM items AS i
    LEFT JOIN outfits AS o ON i.id = o.itemId
    LEFT JOIN (
      SELECT itemId, MAX(timestamp) AS last_laundry_timestamp
      FROM laundry
      GROUP BY itemId
    ) AS l ON i.id = l.itemId
    WHERE o.timestamp > l.last_laundry_timestamp OR l.last_laundry_timestamp IS NULL
    GROUP BY i.id''';
    tabController = TabController(length: _tabOptions.length, vsync: this);
  }


  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  clearData(){
    freshList.clear();
    hangerList.clear();
    basketList.clear();
  }

  fetchData() async {
    clearData();
    final List queryResult = await databaseProvider.allExecutor.query(_querySql);

    for (final queryItem in queryResult) {
      final item = Item.fromMap(queryItem);
      final wornCount = queryItem["worn_count"] as int;

      if (wornCount == 0) {
        freshList.add(item);
      } else if (wornCount < 2) {
        hangerList.add(item);
      } else {
        basketList.add(item);
      }
    }

  }
}
