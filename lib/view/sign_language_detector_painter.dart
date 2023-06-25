import 'package:flutter/material.dart';

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
