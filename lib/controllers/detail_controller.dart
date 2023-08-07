import 'package:drape/model/item.dart';
import 'package:drape/model/outfit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/laundry.dart';

class DetailController extends GetxController {
  late Item item;
  final formKey = GlobalKey<FormState>();

  DetailController();

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments;
  }

  onClickSave() async {
    formKey.currentState?.save();
    await databaseProvider.itemExecutor.modify(item);
    Get.back(result: true);
  }

  addToOutfit() async {
    final outfit = Outfit.fromItem(item);
    await databaseProvider.outfitExecutor.add(outfit);
  }

  addToLaundry() async {
    final laundry = Laundry.fromItem(item);
    await databaseProvider.laundryExecutor.add(laundry);
  }

  deleteItem() {
    databaseProvider.itemExecutor.remove(item.id);
    Fluttertoast.showToast(msg: "Item Deleted");
  }
}
