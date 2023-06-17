import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tflite/tflite.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel = MethodChannel('tflite');

  final List<MethodCall> log = <MethodCall>[];

  setUp(() async {
    channel.setMockMethodCallHandler((MethodCall methodCall) {
      log.add(methodCall);
      return null;
    });
    log.clear();
  });

  testWidgets('loadModel', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await Tflite.loadModel(
        model: 'assets/mobilenet_v1_1.0_224.tflite',
        labels: 'assets/mobilenet_v1_1.0_224.txt',
        numThreads: 2,
        isAsset: false,
        useGpuDelegate: true,
      );
    });
    expect(
      log,
      <Matcher>[
        isMethodCall(
          'loadModel',
          arguments: <String, dynamic>{
            'model': 'assets/mobilenet_v1_1.0_224.tflite',
            'labels': 'assets/mobilenet_v1_1.0_224.txt',
            'numThreads': 2,
            'isAsset': false,
            'useGpuDelegate': true,
          },
        ),
      ],
    );
  });

  testWidgets('runModelOnImage', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await Tflite.runModelOnImage(
        path: '/image/path',
        imageMean: 127.5,
        imageStd: 0.5,
        numResults: 6,
        threshold: 0.1,
        asynch: false,
      );
    });
    expect(
      log,
      <Matcher>[
        isMethodCall(
          'runModelOnImage',
          arguments: <String, dynamic>{
            'path': '/image/path',
            'imageMean': 127.5,
            'imageStd': 0.5,
            'numResults': 6,
            'threshold': 0.1,
            'asynch': false,
          },
        ),
      ],
    );
  });
}
