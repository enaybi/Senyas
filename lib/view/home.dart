import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

import 'drawer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  // Load the model and labels
  await Tflite.loadModel(
    model: 'assets/model/detect.tflite',
    labels: 'assets/model/labelmap.txt',
  );

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(camera: camera),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  const HomeScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<dynamic>? _signLanguageRecognitions;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize().then((_) {
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

  void _startImageStream() async {
    await _controller.startImageStream((CameraImage image) async {
      if (_signLanguageRecognitions != null) {
        // Skip processing if previous detection is not complete
        return;
      }

      // Preprocess the camera image
      final imgHeight = image.height;
      final imgWidth = image.width;
      final convertedImage = _convertCameraImageToUint8List(image);

      // Run sign language detection
      List<dynamic>? recognitions =
          await _detectSignLanguage(convertedImage, imgHeight, imgWidth);

      setState(() {
        _signLanguageRecognitions = recognitions;
      });
    });
  }

  Future<List<dynamic>?> _detectSignLanguage(
    Uint8List imageBytes,
    int imgHeight,
    int imgWidth,
  ) async {
    List<dynamic>? recognitions = await Tflite.detectObjectOnFrame(
      bytesList: [imageBytes],
      model: 'detect.tflite', // Change to your custom model filename
      threshold: 0.4,
      imageHeight: imgHeight,
      imageWidth: imgWidth,
      numResultsPerClass: 1,
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

  Uint8List _convertCameraImageToUint8List(CameraImage image) {
    final plane = image.planes[0];
    final bytesPerRow = plane.bytesPerRow;
    final imageSize = bytesPerRow * image.height;
    return Uint8List.view(plane.bytes.buffer, 0, imageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
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
        ],
      ),
    );
  }
}

class SignLanguageDetectorPainter extends CustomPainter {
  final List<dynamic> recognitions;
  final double imageWidth;
  final double imageHeight;

  SignLanguageDetectorPainter({
    required this.recognitions,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleX = size.width / imageWidth;
    final double scaleY = size.height / imageHeight;

    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      backgroundColor: Colors.black,
    );

    for (final recognition in recognitions) {
      final int classIndex = recognition['index'];
      final String className = _getClassName(classIndex);
      final double confidence = recognition['confidence'];
      final Rect boundingBox = Rect.fromLTRB(
        recognition['rect']['x'] * scaleX,
        recognition['rect']['y'] * scaleY,
        recognition['rect']['w'] * scaleX,
        recognition['rect']['h'] * scaleY,
      );

      final paint = Paint()
        ..color = colors[classIndex % colors.length]
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;

      canvas.drawRect(boundingBox, paint);

      final label = '$className (${(confidence * 100).toStringAsFixed(1)}%)';

      final labelOffset = Offset(
        boundingBox.left,
        boundingBox.top > 20 ? boundingBox.top - 20 : boundingBox.top + 20,
      );

      canvas.drawRect(
        Rect.fromPoints(
          labelOffset,
          Offset(
            labelOffset.dx + label.length * 8.0,
            labelOffset.dy + 20.0,
          ),
        ),
        Paint()..color = Colors.black,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: textStyle,
        ),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, labelOffset);
    }
  }

  String _getClassName(int classIndex) {
    // Modify this method to return the class name based on the provided index
    switch (classIndex) {
      case 0:
        return 'I/Ako';
      case 1:
        return 'Yes/Oo';
      case 2:
        return 'Baby/Sanggol';
      default:
        return 'Unknown';
    }
  }

  @override
  bool shouldRepaint(SignLanguageDetectorPainter oldDelegate) => false;
}
