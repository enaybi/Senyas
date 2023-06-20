import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:senyas/view/home.dart';
import 'package:senyas/view/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
