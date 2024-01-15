import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tflite_flutter/tflite_flutter.dart';

import 'globals.dart';

class BoundingBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  BoundingBox(
    this.results,
    this.previewH,
    this.previewW,
    this.screenH,
    this.screenW,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderBox() {
      return results.map((re) {
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        MyGlobals.sharedText = "${re["detectedClass"]}";

        print(MyGlobals.sharedText);

        return Positioned(
          left: math.max(0, x),
          top: math.max(0, y),
          width: w,
          height: h,
          child: Container(
            padding: EdgeInsets.only(top: 5.0, left: 5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(37, 213, 253, 1.0),
                width: 3.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Color.fromRGBO(37, 213, 253, 1.0),
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList();
    }

    Widget centeredTextBox() {
      // Check if there are any results before updating sharedText
      // if (results.isNotEmpty) {
      //   MyGlobals.sharedText = "${results.first["detectedClass"]}";
      // } else {
      //   MyGlobals.sharedText = ""; // No detection, set empty string
      // }

      return Positioned(
        bottom: 100,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.transparent,
          child: Center(
            child: Text(
              MyGlobals.sharedText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }


    return Stack(
      children: [
        ..._renderBox(),
        centeredTextBox(),
      ],
    );
  }
}

