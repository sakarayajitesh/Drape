import 'package:drape/database/executors/all_executor.dart';
import 'package:drape/database/executors/item_executor.dart';
import 'package:drape/database/executors/laundry_executor.dart';
import 'package:drape/database/executors/outfit_executor.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  late Database db;
  final version = 2;

  late ItemExecutor itemExecutor;
  late OutfitExecutor outfitExecutor;
  late LaundryExecutor laundryExecutor;
  late AllExecutor allExecutor;

  open(String path) async {
    db = await openDatabase(path, version: version,
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE ${ItemExecutor.table} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, image BLOB, type TEXT, color TEXT, occasion TEXT)',
      );
      await db.execute(
        'CREATE TABLE ${OutfitExecutor.table} (id INTEGER PRIMARY KEY AUTOINCREMENT, itemId INTEGER, timestamp INTEGER, image BLOB)',
      );
      await db.execute(
        'CREATE TABLE ${LaundryExecutor.table} (id INTEGER PRIMARY KEY AUTOINCREMENT, itemId INTEGER, timestamp INTEGER, image BLOB)',
      );
    }, onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute(
        'CREATE TABLE ${LaundryExecutor.table} (id INTEGER PRIMARY KEY AUTOINCREMENT, itemId INTEGER, timestamp INTEGER, image BLOB)',
      );
    });
    itemExecutor = ItemExecutor(db);
    outfitExecutor = OutfitExecutor(db);
    laundryExecutor = LaundryExecutor(db);
    allExecutor = AllExecutor(db);
  }

  Future close() async => db.close();
}
