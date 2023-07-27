import 'package:drape/database/database_provider.dart';
import 'package:drape/routes/outfit_route.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  late DatabaseProvider databaseProvider;
  var items = [].obs;

  ExploreController(this.databaseProvider) {}

  onClickTodaysOutfit() {
    Get.to(() => const OutfitRoute());
  }
}
