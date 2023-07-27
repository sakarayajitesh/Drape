import 'package:drape/model/item.dart';

class Laundry {
  int id = -1;
  late int itemId;
  late String image;
  int date = DateTime.now().millisecondsSinceEpoch;

  Laundry();

  Laundry.fromItem(Item item) {
    image = item.image;
    itemId = item.id;
  }

  Laundry.fromMap(map) {
    id = map["id"] as int;
    itemId = map["itemId"] as int;
    date = map["timestamp"] as int;
    image = map["image"] as String;
  }

  Map<String, dynamic> toMap() {
    return {'image': image, 'timestamp': date, 'itemId': itemId};
  }

  @override
  String toString() {
    return 'Laundry{id: $id, itemId: $itemId, timestamp: $date, image: $image,}';
  }
}
