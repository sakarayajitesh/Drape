import 'package:drape/database/base_executor.dart';

base class AllExecutor {
  late final BaseExecutor _baseExecutor;

  AllExecutor(db) {
    _baseExecutor = BaseExecutor(db);
  }

  Future<dynamic> query(sql) async {
    return await _baseExecutor.rawQuery(sql);
  }
}
