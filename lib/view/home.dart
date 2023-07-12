import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:senyas/view/camera.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';

import 'drawer.dart';
import 'bounding_box.dart';
import 'floatingButton.dart';

typedef void Callback(List<dynamic> list, int h, int w);

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const HomeScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? _recognitions = List.empty();
  int _imageHeight = 0;
  int _imageWidth = 0;

  void loadModelFromAssets() async {
    await Tflite.loadModel(
      model: 'assets/model/detect.tflite',
      labels: 'assets/model/labelmap.txt',
      numThreads: 2,
    );
  }

  /*
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    loadModelFromAssets();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions! == null ? [] : _recognitions!,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
        ],
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
