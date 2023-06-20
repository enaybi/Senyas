import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'drawer.dart';
import 'floatingButton.dart';

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
      false; // flag to prevent the intepreter from calling multiple functions of detectObject

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
      // setState(() {});

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
    // try to tweak the configuration of the function
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

  // not needed, this only causes an error when running on detectObject
  Uint8List _convertYUV420ToImage(CameraImage image) {
    final plane = image.planes[0];
    final bytesPerRow = plane.bytesPerRow;
    final imageSize = bytesPerRow * image.height;
    return Uint8List.view(plane.bytes.buffer, 0, imageSize);
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

    final textStyle = const TextStyle(
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
        boundingBox.top > 15.0
            ? boundingBox.top - 15.0
            : boundingBox.top + 15.0,
      );

      canvas.drawRect(
        Rect.fromLTWH(
          labelOffset.dx - 2.0,
          labelOffset.dy - 20.0,
          label.length * 9.0 + 4.0,
          24.0,
        ),
        Paint()..color = Colors.black,
      );

      canvas.drawRect(
        Rect.fromLTWH(
          labelOffset.dx - 2.0,
          labelOffset.dy - 20.0,
          label.length * 9.0 + 4.0,
          24.0,
        ),
        Paint()..color = colors[classIndex % colors.length],
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            labelOffset.dx - 2.0,
            labelOffset.dy - 20.0,
            label.length * 9.0 + 4.0,
            24.0,
          ),
          const Radius.circular(12.0),
        ),
        Paint()..color = Colors.black,
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            labelOffset.dx - 2.0,
            labelOffset.dy - 20.0,
            label.length * 9.0 + 4.0,
            24.0,
          ),
          const Radius.circular(12.0),
        ),
        Paint()..color = colors[classIndex % colors.length],
      );

      TextPainter(
        text: TextSpan(
          text: label,
          style: textStyle,
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: 0, maxWidth: size.width)
        ..paint(
          canvas,
          labelOffset,
        );
    }
  }

  @override
  bool shouldRepaint(SignLanguageDetectorPainter oldDelegate) {
    return oldDelegate.recognitions != recognitions;
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
