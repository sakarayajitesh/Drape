import 'package:drape/database/database_provider.dart';
import 'package:drape/model/item.dart';
import 'package:drape/model/outfit.dart';
import 'package:get/get.dart';

import '../model/laundry.dart';

class DetailController extends GetxController {
  late Item item;
  late DatabaseProvider databaseProvider;

  DetailController(this.databaseProvider);

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments;
  }

  onClickSave() async {
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
}
