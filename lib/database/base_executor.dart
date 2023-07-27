import 'package:sqflite/sqflite.dart';

base class BaseExecutor {
  final Database _db;

  BaseExecutor(this._db);

  Future<dynamic> rawQuery(sql) async {
    return await _db.rawQuery(sql);
  }

  Future<dynamic> insert(table, dynamic data) async {
    return await _db.insert(
      table,
      data,
    );
  }

  Future<dynamic> get(table, {condition, args}) async {
    dynamic result;
    if (condition.isNotEmpty) {
      result = await _db.query(
        table,
        where: condition,
        whereArgs: args,
      );
    } else {
      result = await _db.query(
        table,
      );
    }
    return result;
  }

  Future<int> delete(table, int id) async {
    return await _db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(table, data, id) async {
    return await _db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
