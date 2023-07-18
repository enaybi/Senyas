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
  }

  Future<void> insertdata(List<Map<String, dynamic>> data) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var row in data) {
        await txn.insert('fsl_table', row);
      }
    });
  }
  final List<Map<String, dynamic>> dataList = [
    {
      'id': 0,
      'imageCategory': 'Alphabeth',
      'imageName': 'A',
      'imagePath': 'assets/classes_content/Alphabeths/A.png'
    },
    {
      'id': 1,
      'imageCategory': 'Alphabeth',
      'imageName': 'B',
      'imagePath': 'assets/classes_content/Alphabeths/B.png'
    },
    {
      'id': 2,
      'imageCategory': 'Alphabeth',
      'imageName': 'C',
      'imagePath': 'assets/classes_content/Alphabeths/C.png'
    },
    {
      'id': 3,
      'imageCategory': 'Alphabeth',
      'imageName': 'D',
      'imagePath': 'assets/classes_content/Alphabeths/D.png'
    },
    {
      'id': 4,
      'imageCategory': 'Alphabeth',
      'imageName': 'E',
      'imagePath': 'assets/classes_content/Alphabeths/E.png'
    },
    {
      'id': 5,
      'imageCategory': 'Alphabeth',
      'imageName': 'F',
      'imagePath': 'assets/classes_content/Alphabeths/F.png'
    },
    {
      'id': 6,
      'imageCategory': 'Alphabeth',
      'imageName': 'G',
      'imagePath': 'assets/classes_content/Alphabeths/G.png'
    },
    {
      'id': 7,
      'imageCategory': 'Alphabeth',
      'imageName': 'H',
      'imagePath': 'assets/classes_content/Alphabeths/H.png'
    },
    {
      'id': 8,
      'imageCategory': 'Alphabeth',
      'imageName': 'I',
      'imagePath': 'assets/classes_content/Alphabeths/I.png'
    },
    {
      'id': 9,
      'imageCategory': 'Alphabeth',
      'imageName': 'J',
      'imagePath': 'assets/classes_content/Alphabeths/J.png'
    },
    {
      'id': 10,
      'imageCategory': 'Alphabeth',
      'imageName': 'K',
      'imagePath': 'assets/classes_content/Alphabeths/K.png'
    },
    {
      'id': 11,
      'imageCategory': 'Alphabeth',
      'imageName': 'L',
      'imagePath': 'assets/classes_content/Alphabeths/L.png'
    },
    {
      'id': 12,
      'imageCategory': 'Alphabeth',
      'imageName': 'M',
      'imagePath': 'assets/classes_content/Alphabeths/M.png'
    },
    {
      'id': 13,
      'imageCategory': 'Alphabeth',
      'imageName': 'N',
      'imagePath': 'assets/classes_content/Alphabeths/N.png'
    },
    {
      'id': 14,
      'imageCategory': 'Alphabeth',
      'imageName': 'O',
      'imagePath': 'assets/classes_content/Alphabeths/O.png'
    },
    {
      'id': 15,
      'imageCategory': 'Alphabeth',
      'imageName': 'P',
      'imagePath': 'assets/classes_content/Alphabeths/P.png'
    },
    {
      'id': 16,
      'imageCategory': 'Alphabeth',
      'imageName': 'Q',
      'imagePath': 'assets/classes_content/Alphabeths/Q.png'
    },
    {
      'id': 17,
      'imageCategory': 'Alphabeth',
      'imageName': 'R',
      'imagePath': 'assets/classes_content/Alphabeths/R.png'
    },
    {
      'id': 18,
      'imageCategory': 'Alphabeth',
      'imageName': 'S',
      'imagePath': 'assets/classes_content/Alphabeths/S.png'
    },
    {
      'id': 19,
      'imageCategory': 'Alphabeth',
      'imageName': 'T',
      'imagePath': 'assets/classes_content/Alphabeths/T.png'
    },
    {
      'id': 20,
      'imageCategory': 'Alphabeth',
      'imageName': 'U',
      'imagePath': 'assets/classes_content/Alphabeths/U.png'
    },
    {
      'id': 21,
      'imageCategory': 'Alphabeth',
      'imageName': 'V',
      'imagePath': 'assets/classes_content/Alphabeths/V.png'
    },
    {
      'id': 22,
      'imageCategory': 'Alphabeth',
      'imageName': 'W',
      'imagePath': 'assets/classes_content/Alphabeths/W.png'
    },
    {
      'id': 23,
      'imageCategory': 'Alphabeth',
      'imageName': 'X',
      'imagePath': 'assets/classes_content/Alphabeths/X.png'
    },
    {
      'id': 24,
      'imageCategory': 'Alphabeth',
      'imageName': 'Y',
      'imagePath': 'assets/classes_content/Alphabeths/Y.png'
    },
    {
      'id': 25,
      'imageCategory': 'Alphabeth',
      'imageName': 'Z',
      'imagePath': 'assets/classes_content/Alphabeths/Z.png'
    },
    {
      'id': 26,
      'imageCategory': 'Number',
      'imageName': '1',
      'imagePath': 'assets/classes_content/Numbers/1.png'
    },
    {
      'id': 27,
      'imageCategory': 'Number',
      'imageName': '2',
      'imagePath': 'assets/classes_content/Numbers/2.png'
    },
    {
      'id': 28,
      'imageCategory': 'Number',
      'imageName': '3',
      'imagePath': 'assets/classes_content/Numbers/3.png'
    },
    {
      'id': 29,
      'imageCategory': 'Number',
      'imageName': '4',
      'imagePath': 'assets/classes_content/Numbers/4.png'
    },
    {
      'id': 30,
      'imageCategory': 'Number',
      'imageName': '5',
      'imagePath': 'assets/classes_content/Numbers/5.png'
    },
    {
      'id': 31,
      'imageCategory': 'Number',
      'imageName': '6',
      'imagePath': 'assets/classes_content/Numbers/6.png'
    },
    {
      'id': 32,
      'imageCategory': 'Number',
      'imageName': '7',
      'imagePath': 'assets/classes_content/Numbers/7.png'
    },
    {
      'id': 33,
      'imageCategory': 'Number',
      'imageName': '8',
      'imagePath': 'assets/classes_content/Numbers/8.png'
    },
    {
      'id': 34,
      'imageCategory': 'Number',
      'imageName': '9',
      'imagePath': 'assets/classes_content/Numbers/9.png'
    },
    {
      'id': 35,
      'imageCategory': 'Number',
      'imageName': '10',
      'imagePath': 'assets/classes_content/Numbers/10.png'
    },
    {
      'id': 36,
      'imageCategory': 'Number',
      'imageName': '1',
      'imagePath': 'assets/classes_content/Numbers/1.png'
    },
  ];

  Future<List<FSL_Class>> fetchdata() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('fsl_table');
    return List.generate(maps.length, (i) {
      return FSL_Class(
          id: maps[i]['id'],
          imageCategory: maps[i]['imageCategory'],
          imageName: maps[i]['imageName'],
          imagePath: maps[i]['imagePath']);
    });
  }

  Future<void> searchdata() async {
    final db = await database;
    final List<Map<String, dynamic>> searchResult =
        await db.rawQuery('SELECT * FROM fsl_table WHERE imageName=? ');
  }

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
