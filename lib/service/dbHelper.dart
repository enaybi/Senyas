import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/db_model.dart';

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
      CREATE TABLE IF NOT EXISTS fsl_table(
        id INTEGER PRIMARY KEY,
        imageCategory TEXT NOT NULL,
        imageName TEXT NOT NULL,
        imagePath TEXT NOT NULL)
      ''');

    await db.insert('fsl_table', {
      'imagecategory': 'Alphabeth',
      'imagename': 'A',
      'imagepath': 'assets/classes_content/Alphabets/A.png',
    });
    await db.insert('fsl_table', {
      'imagecategory': 'Alphabeth',
      'imagename': 'B',
      'imagepath': 'assets/classes_content/Alphabets/B.png',
    });
    await db.insert('fsl_table', {
      'imagecategory': 'Number',
      'imagename': '1',
      'imagepath': 'assets/classes_content/Numbers/1.png',
    });
  }
    
  }

  Future _fetchAllData() async {
    final db = await openDatabase('FSLDB.db');
    final dbResult = await db.query('fsl_table');
  }

  /*Future _fetchAlphabethData(Database db, int version) async {
    final db = await database;
    await db.query("SELECT * FROM image_table WHERE imageCategory = Alphabeth");

    Future _fetchNumberData(Database db, int version) async {
    final db = await database;
    await db.query("SELECT * FROM image_table WHERE imageCategory = Number");
  }
  
  Future<void> insertData() async {
  // Get a reference to the database path
  String path = join(await getDatabasesPath(), 'FSLDB.db');

  // Open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    // Create the table if it doesn't exist
    await db.execute(
        'CREATE TABLE IF NOT EXISTS fsl_table (id INTEGER PRIMARY KEY, imagecategory TEXT, imagename TEXT, imagepath TEXT)');
  });

  // Insert data into the table
  await database.insert('fsl_table', {
    'imagecategory': 'Alphabeth',
    'imagename': 'A',
    'imagepath': 'assets/classes_content/Alphabets/A.png',
  });

  await database.insert('fsl_table', {
    'imagecategory': 'Number',
    'imagename': '1',
    'imagepath': 'assets/classes_content/Numbers/1.pngg',
  });

  // Close the database
  await database.close();
}
List<Map<String, dynamic>> data = [];

Future<void> fetchData() async {
  // Get a reference to the database path
  String path = join(await getDatabasesPath(), 'FSLDB.db');

  // Open the database
  Database database = await openDatabase(path, version: 1);

  // Fetch all rows from the table
  List<Map<String, dynamic>> result = await database.query('fsl_table');

  // Update the data variable with the fetched data
  setState(() {
    data = result;
  });

  // Close the database
  await database.close();
}*/

/*'''
      INSERT INTO FSL_table (imageCategory, imageName, imagePath)
      VALUES ("Alphabeth", "A", "assets/classes_content/alphabeths/A.png"),
      ("Alphabeth", "B", "assets/classes_content/Alphabeths/B.png"),
      ("Alphabeth", "c", "assets/classes_content/Alphabeths/C.png"),
      ("Alphabeth", "D", "assets/classes_content/Alphabeths/D.png"),
      ("Alphabeth", "E", "assets/classes_content/Alphabeths/E.png"),
      ("Alphabeth", "F", "assets/classes_content/Alphabeths/F.png"),
      ("Alphabeth", "G", "assets/classes_content/Alphabeths/G.png"),
      ("Alphabeth", "H", "assets/classes_content/Alphabeths/H.png"),
      ("Alphabeth", "I", "assets/classes_content/Alphabeths/I.png"),
      ("Alphabeth", "J", "assets/classes_content/Alphabeths/J.png"),
      ("Alphabeth", "K", "assets/classes_content/Alphabeths/K.png"),
      ("Alphabeth", "L", "assets/classes_content/Alphabeths/L.png"),
      ("Alphabeth", "M", "assets/classes_content/Alphabeths/M.png"),
      ("Alphabeth", "N", "assets/classes_content/Alphabeths/N.png"),
      ("Alphabeth", "O", "assets/classes_content/Alphabeths/O.png"),
      ("Alphabeth", "P", "assets/classes_content/Alphabeths/P.png"),
      ("Alphabeth", "Q", "assets/classes_content/Alphabeths/Q.png"),
      ("Alphabeth", "R", "assets/classes_content/Alphabeths/R.png"),
      ("Alphabeth", "S", "assets/classes_content/Alphabeths/S.png"),
      ("Alphabeth", "T", "assets/classes_content/Alphabeths/T.png"),
      ("Alphabeth", "U", "assets/classes_content/Alphabeths/U.png"),
      ("Alphabeth", "V", "assets/classes_content/Alphabeths/V.png"),
      ("Alphabeth", "W", "assets/classes_content/Alphabeths/W.png"),
      ("Alphabeth", "X", "assets/clsses_content/Alphabeths/X.png"),
      ("Alphabeth", "Y", "assets/classes_content/Alphabeths/Y.png"),
      ("Alphabeth", "Z", "assets/classes_content/Alphabeths/Z.png"),
      ("Basic Adjective", "Bad/Masama", "assets/classes_content/BasicAdjectives/Bad.jpg"),
      ("Basic Adjective", "Difficult/Mahirap", "assets/classes_content/BasicAdjectives/Difficult.jpg"),
      ("Basic Adjective", "Easy/Madali", "assets/classes_content/BasicAdjectives/Easy.png"),
      ("Basic Adjective", "Fast/Mabilis", "assets/classes_content/BasicAdjectives/Fast.png"),
      ("Basic Adjective", "Good/Mabait", "assets/classes_content/BasicAdjectives/Good.png"),
      ("Basic Adjective", "New/Bago", "assets/classes_content/BasicAdjectives/New.jpg"),
      ("Basic Adjective", "Old/Matanda", "assets/classes_content/BasicAdjectives/Old.png"),
      ("Basic Adjective", "Slow/Mabagal", "assets/classes_content/BasicAdjectives/Slow.png"),
      ("Basic Questions", "How/Paano", "assets/classes_content/BasicQuestions/How.jpg"),
      ("Number", "1", "assets/classes_content/Numbers/1.png"),
      ("Number", "2", "assets/classes_content/Numbers/2.png"),
      ("Number", "3", "assets/classes_content/Numbers/3.png"),
      ("Number", "4", "assets/classes_content/Numbers/4.png"),
      ("Number", "5", "assets/classes_content/Numbers/5.png"),
      ("Number", "6", "assets/classes_content/Numbers/6.png"),
      ("Number", "7", "assets/classes_content/Numbers/7.png"),
      ("Number", "8", "assets/classes_content/Numbers/8.png"),
      ("Number", "9", "assets/classes_content/Numbers/9.png"),
      ("Number", "10", "assets/classes_content/Numbers/10.png")'''*/
