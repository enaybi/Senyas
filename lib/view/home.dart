import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'drawer.dart';
import 'bounding_box.dart';
import 'floatingButton.dart';

typedef void Callback(List<dynamic> list, int h, int w);

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  const HomeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController? controller;
  List<dynamic>? _signLanguageRecognitions;
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    loadModelFromAssets();
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _startImageStream();
    });
  }

  @override
  void dispose() {
    controller?.stopImageStream();
    controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  void loadModelFromAssets() async {
    await Tflite.loadModel(
      model: 'assets/model/detect.tflite',
      labels: 'assets/model/labelmap.txt',
      numThreads: 2,
    );
  }

  void _startImageStream() async {
    await controller!.startImageStream((CameraImage image) async {
      if (isDetecting) {
        return;
      }
      print("Running SSD...");
      isDetecting = true;

      final imgHeight = image.height;
      final imgWidth = image.width;

      List<dynamic>? recognitions = await _detectSignLanguage(
        image,
        imgHeight,
        imgWidth,
      );

      if (recognitions != null && recognitions.isNotEmpty) {
        print(recognitions.first);
      }
      setState(() {
        _signLanguageRecognitions = recognitions;
        isDetecting = false;
      });
    });
  }

  Future<List<dynamic>?> _detectSignLanguage(
      CameraImage image, int imgHeight, int imgWidth) async {
    List<dynamic>? recognitions = await Tflite.detectObjectOnFrame(
      bytesList: image.planes.map((plane) => plane.bytes).toList(),
      threshold: 0.3, // Adjust the threshold value for object detection
      imageHeight: imgHeight,
      imageWidth: imgWidth,
      imageMean: 0.0, // Adjust the imageMean value for normalization
      imageStd: 1.0, // Adjust the imageStd value for normalization
      asynch: true,
      numResultsPerClass: 5,
    );

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
    if (!controller!.value.isInitialized) {
      return Container();
    }

    Size tmp = MediaQuery.of(context).size;
    double screenH = math.max(tmp.height, tmp.width);
    double screenW = math.min(tmp.height, tmp.width);
    tmp = controller!.value.previewSize!;
    double previewH = math.max(tmp.height, tmp.width);
    double previewW = math.min(tmp.height, tmp.width);
    double screenRatio = screenH / screenW;
    double previewRatio = previewH / previewW;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: CameraPreview(controller!),
            ),
          ),
          if (_signLanguageRecognitions != null)
            Positioned.fill(
              child: BoundingBox(
                _signLanguageRecognitions!,
                controller!.value.previewSize!.height.toInt(),
                controller!.value.previewSize!.width.toInt(),
                screenH,
                screenW,
              ),
            ),
        ],
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
