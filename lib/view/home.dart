import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'drawer.dart';
import 'floatingButton.dart';
import 'sign_language_detector_painter.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  const HomeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _controller;
  List<dynamic>? _signLanguageRecognitions;
  bool isDetecting =
      false; // flag to prevent the interpreter from calling multiple functions of detectObject

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    loadModelFromAssets(); // load the model using this method
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _startImageStream();
    });
  }

  @override
  void dispose() {
    _controller.stopImageStream();
    _controller.dispose();
    Tflite.close();
    super.dispose();
  }

  // function to load the model from assets
  // required
  void loadModelFromAssets() async {
    await Tflite.loadModel(
      model: 'assets/model/detect.tflite',
      labels: 'assets/model/labelmap.txt',
      numThreads: 2,
    );
  }

  void _startImageStream() async {
    await _controller.startImageStream((CameraImage image) async {
      if (isDetecting) {
        // Skip processing if previous detection is not complete
        return;
      }
      print("Running SSD...");
      isDetecting = true;
      // Preprocess the camera image
      final imgHeight = image.height;
      final imgWidth = image.width;

      // Run sign language detection
      List<dynamic>? recognitions =
          await _detectSignLanguage(image, imgHeight, imgWidth);

      if (recognitions != null && recognitions.isNotEmpty) {
        print(recognitions.first);
      }
      setState(() {
        _signLanguageRecognitions = recognitions;
        isDetecting = false; // set the flag to false to start the detectObject
      });
    });
  }

  Future<List<dynamic>?> _detectSignLanguage(
      CameraImage image, int imgHeight, int imgWidth) async {
    List<dynamic>? recognitions = await Tflite.detectObjectOnFrame(
      bytesList: image.planes.map((plane) => plane.bytes).toList(),
      threshold: 0.4, // removes results that have a lower confidence value
      imageHeight: imgHeight,
      imageWidth: imgWidth,
      imageMean: 127.5, // default is 127.5
      imageStd: 127.5, // default is 127.5
      asynch: true,
      numResultsPerClass: 5,
    );

    // Normalize the bounding box coordinates
    if (recognitions != null) {
      for (var recognition in recognitions) {
        recognition['rect']['x'] = recognition['rect']['x'] / imgWidth;
        recognition['rect']['y'] = recognition['rect']['y'] / imgHeight;
        recognition['rect']['w'] = recognition['rect']['w'] / imgWidth;
        recognition['rect']['h'] = recognition['rect']['h'] / imgHeight;
      }
    }

    return recognitions;
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: CameraPreview(_controller),
            ),
          ),
          if (_signLanguageRecognitions != null)
            Positioned.fill(
              child: CustomPaint(
                painter: SignLanguageDetectorPainter(
                  recognitions: _signLanguageRecognitions!,
                  imageWidth: _controller.value.previewSize!.width,
                  imageHeight: _controller.value.previewSize!.height,
                ),
              ),
            ),
          FloatingButton(),
        ],
      ),
    );
  }
}
