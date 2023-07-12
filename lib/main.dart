import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:senyas/model/db_model.dart';
import 'package:senyas/view/home.dart';
import 'package:senyas/view/onboarding_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'service/dbHelper.dart';

List<CameraDescription> cameras = List.empty();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'fsl_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE fsl_table(id INTEGER PRIMARY KEY, imageCategory TEXT, imageName TEXT, imagePath TEXT)',
      );
    },
    version: 1,
  );

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

  await insertdata(dataList);
  await fetchdata();

  print(await fetchdata());

  //await DatabaseHelper().instance.database;
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/home': (context) => HomeScreen(cameras: cameras),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
