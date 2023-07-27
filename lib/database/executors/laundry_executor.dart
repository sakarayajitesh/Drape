import '../../model/laundry.dart';
import '../base_executor.dart';

base class LaundryExecutor {
  static const table = "laundry";

  late final BaseExecutor _baseExecutor;

  LaundryExecutor(db) {
    _baseExecutor = BaseExecutor(db);
  }

  Future<int> add(Laundry laundry) async {
    return await _baseExecutor.insert(table, laundry.toMap());
  }

  Future<List<Laundry>> read({
    String condition = "",
    args,
  }) async {
    final maps = await _baseExecutor.get(
      table,
      condition: condition,
      args: args,
    );
    return List.generate(maps.length, (i) {
      return Laundry.fromMap(maps[i]);
    });
  }

  Future<int> remove(int id) async {
    return await _baseExecutor.delete(table, id);
  }

  Future<void> modify(data) async {
    await _baseExecutor.update(table, data.toMap(), data.id);
  }
}
