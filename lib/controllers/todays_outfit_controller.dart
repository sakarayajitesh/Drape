import 'package:dart_date/dart_date.dart';
import 'package:drape/main.dart';
import 'package:drape/model/outfit.dart';
import 'package:get/get.dart';

class TodaysOutfitController extends GetxController {
  RxList<Outfit> outfits = <Outfit>[].obs;

  final condition = "timestamp > ?";
  final args = [DateTime.now().startOfDay.millisecondsSinceEpoch];

  TodaysOutfitController() {
    get();
  }

  get() async {
    outfits.value = await databaseProvider.outfitExecutor.read(
      condition: condition,
      args: args,
    );
  }
}
