import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/db_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Images.db';
  static const sql =
      "CREATE TABLE image_table(id INTEGER PRIMARY KEY, name TEXT NOT NULL, imagePath TEXT NOT NULL);";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(sql),
        version: _version);
  }

  static Future<int> addImages(Images images) async {
    final db = await _getDB();
    return await db.insert("Images", images.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
