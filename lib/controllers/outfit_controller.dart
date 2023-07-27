import 'package:drape/helpers.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/outfit.dart';

class OutfitController extends GetxController {
  RxMap<String, List<Outfit>> outfitMap = <String, List<Outfit>>{}.obs;

  OutfitController() {
    get();
  }

  get() async {
    List<Outfit> outfits = await databaseProvider.outfitExecutor.read();

    for (var outfit in outfits) {
      String key = outfit.date.toDateFormat();
      if (outfitMap.containsKey(key)) {
        outfitMap[key]?.add(outfit);
      } else {
        outfitMap[key] = [outfit];
      }
    }
  }
}
