import 'package:drape/database/base_executor.dart';

import '../../model/item.dart';

base class ItemExecutor {
  static const table = "items";

  late final BaseExecutor _baseExecutor;

  ItemExecutor(db) {
    _baseExecutor = BaseExecutor(db);
  }

  Future<Item> add(Item item) async {
    item.id = await _baseExecutor.insert(table, item.toMap());
    return item;
  }

  Future<List<Item>> read({String condition = "", dynamic args}) async {
    final maps = await _baseExecutor.get(
      table,
      condition: condition,
      args: args,
    );
    return List.generate(maps.length, (i) {
      return Item.fromMap(maps[i]);
    });
  }

  Future<int> remove(int id) async {
    return await _baseExecutor.delete(table, id);
  }

  Future<void> modify(Item data) async {
    await _baseExecutor.update(table, data.toMap(), data.id);
  }
}
