import 'package:drape/database/database_provider.dart';
import 'package:get/get.dart';

class StatsController extends GetxController {
  DatabaseProvider databaseProvider;
  var stats = <Map<String, Object?>>[].obs;

  StatsController(this.databaseProvider) {
    getStats();
  }

  getStats() async {
    // List<Map<String, Object?>> result = [];
    // result.addAll(await itemProvider.stats());
    // result.removeWhere((element){
    //   // print(element["type"]==null);
    //   return element["type"]==null;
    // });
    // stats.value = result;
  }
}
