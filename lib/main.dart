import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:senyas/view/home.dart';
import 'package:senyas/view/onboarding_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'service/dbHelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'fsl_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE IF NOT EXIST fsl_table(id INTEGER PRIMARY KEY, imageCategory TEXT, imageName TEXT, imagePath TEXT)');
    },
    version: 1,
  );
  final cameras = await availableCameras();
  // cameras.first refers to the back camera, cameras.last refers to the front camera
  final firstCamera = cameras.last;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

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
        '/home': (context) => HomeScreen(camera: camera),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
