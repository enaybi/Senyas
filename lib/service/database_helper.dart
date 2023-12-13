import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'data_manager.dart';
import 'data_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'fsl_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE fsl_table(id INTEGER PRIMARY KEY, imageCategory TEXT, imageName TEXT, imagePath TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertData() async {
    final db = await database;
    await db.transaction((txn) async {
      for (var row in dataList) {
        print(row);
        await txn.insert('fsl_table', row,
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      print("finished");
    });
  }

  Future<List<FslClass>> fetchData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('fsl_table');
    return List.generate(maps.length, (i) {
      return FslClass(
        id: maps[i]['id'],
        imageCategory: maps[i]['imageCategory'],
        imageName: maps[i]['imageName'],
        imagePath: maps[i]['imagePath'],
      );
    });
  }

  Future<List<FslClass>> searchFSLImage(String keyword) async {
    print("starting code");
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM fsl_table WHERE imageName LIKE ?',
      ['%$keyword%'],
    );
    print("debugging");
    print(maps);
    return List.generate(maps.length, (i) {
      return FslClass(
        id: maps[i]['id'],
        imageCategory: maps[i]['imageCategory'],
        imageName: maps[i]['imageName'],
        imagePath: maps[i]['imagePath'],
      );
    });
  }

  Future<void> deleteData() async {
    final db = await database;
    await db.delete(
      'fsl_table',
      // where: 'id = ?',
      // whereArgs: [id],
    );
  }

  Future<List<FslClass>> searchCategory(String keyword) async {
    print("starting code");
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM fsl_table WHERE imageCategory LIKE ?',
      ['%$keyword%'],
    );
    print("debugging");
    print(maps);
    return List.generate(maps.length, (i) {
      return FslClass(
        id: maps[i]['id'],
        imageCategory: maps[i]['imageCategory'],
        imageName: maps[i]['imageName'],
        imagePath: maps[i]['imagePath'],
      );
    });
  }
}
