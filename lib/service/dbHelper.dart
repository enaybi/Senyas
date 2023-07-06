import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//import '../model/db_model.dart';

Database? _database;

class DatabaseHelper {
  Future get database async {
    if (_database != null) return _database;
    _database = await _initializeDB("FSLDB.db");
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS FSL_table(
        id INTEGER PRIMARY KEY,
        imageCategory TEXT NOT NULL,
        imageName TEXT NOT NULL,
        imagePath TEXT NOT NULL)
      ''');
  }

  Future _tableData(Database db, int version) async {
    final db = await database;
    await db.insert('''
      INSERT INTO FSL_table (imageCategory, imageName, imagePath)
      VALUES ("Alphabeth", "A", "assets/classes_content/alphabeths/A.png"),
      ("Alphabeth", "B", "assets/classes_content/alphabeths/B.png"),
      ("Alphabeth", "c", "assets/classes_content/alphabeths/C.png"),
      ("Alphabeth", "D", "assets/classes_content/alphabeths/D.png"),
      ("Alphabeth", "E", "assets/classes_content/alphabeths/E.png"),
      ("Alphabeth", "F", "assets/classes_content/alphabeths/F.png"),
      ("Alphabeth", "G", "assets/classes_content/alphabeths/G.png"),
      ("Alphabeth", "H", "assets/classes_content/alphabeths/H.png"),
      ("Alphabeth", "I", "assets/classes_content/alphabeths/I.png"),
      ("Alphabeth", "J", "assets/classes_content/alphabeths/J.png"),
      ("Alphabeth", "K", "assets/classes_content/alphabeths/K.png"),
      ("Alphabeth", "L", "assets/classes_content/alphabeths/L.png"),
      ("Alphabeth", "M", "assets/classes_content/alphabeths/M.png"),
      ("Alphabeth", "N", "assets/classes_content/alphabeths/N.png"),
      ("Alphabeth", "O", "assets/classes_content/alphabeths/O.png"),
      ("Alphabeth", "P", "assets/classes_content/alphabeths/P.png"),
      ("Alphabeth", "Q", "assets/classes_content/alphabeths/Q.png"),
      ("Alphabeth", "R", "assets/classes_content/alphabeths/R.png"),
      ("Alphabeth", "S", "assets/classes_content/alphabeths/S.png"),
      ("Alphabeth", "T", "assets/classes_content/alphabeths/T.png"),
      ("Alphabeth", "U", "assets/classes_content/alphabeths/U.png"),
      ("Alphabeth", "V", "assets/classes_content/alphabeths/V.png"),
      ("Alphabeth", "W", "assets/classes_content/alphabeths/W.png"),
      ("Alphabeth", "X", "assets/classes_content/alphabeths/X.png"),
      ("Alphabeth", "Y", "assets/classes_content/alphabeths/Y.png"),
      ("Alphabeth", "Z", "assets/classes_content/alphabeths/Z.png"),
      ("Number", "1", "assets/classes_content/numbers/1.png"),
      ("Number", "2", "assets/classes_content/numbers/2.png"),
      ("Number", "3", "assets/classes_content/numbers/3.png"),
      ("Number", "4", "assets/classes_content/numbers/4.png"),
      ("Number", "5", "assets/classes_content/numbers/5.png"),
      ("Number", "6", "assets/classes_content/numbers/6.png"),
      ("Number", "7", "assets/classes_content/numbers/7.png"),
      ("Number", "8", "assets/classes_content/numbers/8.png"),
      ("Number", "9", "assets/classes_content/numbers/9.png"),
      ("Number", "10", "assets/classes_content/numbers/10.png");
      ''');
  }

  Future _fetchAllData(Database db, int version) async {
    final db = await openDatabase('FSLDB.db');
    return await db.query('FSL_table');
  }

  /*Future _fetchAlphabethData(Database db, int version) async {
    final db = await database;
    await db.query("SELECT * FROM image_table WHERE imageCategory = Alphabeth");

    Future _fetchNumberData(Database db, int version) async {
    final db = await database;
    await db.query("SELECT * FROM image_table WHERE imageCategory = Number");
  }*/
}
