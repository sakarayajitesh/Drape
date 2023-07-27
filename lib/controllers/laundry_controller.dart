import 'package:drape/main.dart';
import 'package:drape/model/item.dart';
import 'package:get/get.dart';

class LaundryController extends GetxController {
  final _querySql = '''SELECT i.*, COUNT(o.id) AS worn_count
    FROM items AS i
    JOIN outfits AS o ON i.id = o.itemId
    LEFT JOIN (
      SELECT itemId, MAX(timestamp) AS last_laundry_timestamp
      FROM laundry
      GROUP BY itemId
    ) AS l ON i.id = l.itemId
    WHERE o.timestamp > l.last_laundry_timestamp OR l.last_laundry_timestamp IS NULL
    GROUP BY i.id''';

  final hangerList = <Item>[].obs;
  final basketList = <Item>[].obs;

  LaundryController() {
    get();
  }

  get() async {
    final dynamic = await databaseProvider.allExecutor.query(_querySql);
    for (var queryItem in dynamic) {
      // debugPrint(queryItem.toString());
      final item = Item.fromMap(queryItem);
      if (queryItem["worn_count"] < 2) {
        hangerList.add(item);
      } else {
        basketList.add(item);
      }
    }
  }
}
