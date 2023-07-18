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
