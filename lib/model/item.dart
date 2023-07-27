class Item {
  int id = -1;
  late String name;
  late String image;
  String? type;
  String? color;
  String? occasion;

  Item({
    required this.name,
    required this.image,
    this.type,
    this.color,
    this.occasion,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'type': type,
      'color': color,
      'occasion': occasion,
    };
  }

  Item.fromMap(map) {
    id = map["id"] as int;
    name = map["name"] as String;
    image = map["image"] as String;
    type = map["type"] as String?;
    color = map["color"] as String?;
    occasion = map["occasion"] as String?;
  }

  @override
  String toString() {
    return 'Item{id: $id, name: $name, type: $type, color: $color, occasion: $occasion}';
  }
}
