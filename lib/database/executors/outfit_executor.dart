import 'package:drape/database/base_executor.dart';

import '../../model/outfit.dart';

base class OutfitExecutor {
  static const table = "outfits";

  late final BaseExecutor _baseExecutor;

  OutfitExecutor(db) {
    _baseExecutor = BaseExecutor(db);
  }

  Future<int> add(Outfit outfit) async {
    return await _baseExecutor.insert(table, outfit.toMap());
  }

  Future<List<Outfit>> read({
    String condition = "",
    args,
  }) async {
    final maps = await _baseExecutor.get(
      table,
      condition: condition,
      args: args,
    );
    return List.generate(maps.length, (i) {
      return Outfit.fromMap(maps[i]);
    });
  }

  Future<int> remove(int id) async {
    return await _baseExecutor.delete(table, id);
  }

  Future<void> modify(data) async {
    await _baseExecutor.update(table, data.toMap(), data.id);
  }
}
