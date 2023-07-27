import 'package:drape/model/item.dart';

class Outfit {
  int id = -1;
  late int itemId;
  late String image;
  int date = DateTime.now().millisecondsSinceEpoch;

  Outfit();

  Outfit.fromItem(Item item) {
    image = item.image;
    itemId = item.id;
  }

  Outfit.fromMap(map) {
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
    return 'Outfit{id: $id, itemId: $itemId, timestamp: $date, image: $image,}';
  }
}
