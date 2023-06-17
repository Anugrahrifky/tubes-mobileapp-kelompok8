import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  late Future<void> cameraInitializer;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras![0], ResolutionPreset.medium);
    cameraInitializer = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void takePicture() async {
    if (!controller.value.isInitialized) {
      return;
    }

    try {
      await cameraInitializer;
      final path = await controller.takePicture();
      print('Foto tersimpan di: ${path.path}');
    } catch (e) {
      print('Error saat mengambil foto: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Camera App'),
          backgroundColor: Color.fromARGB(255, 228, 3, 3),
        ),
        backgroundColor: Color.fromARGB(255, 241, 155, 155),
        body: FutureBuilder<void>(
          future: cameraInitializer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: takePicture,
        ),
      ),
    );
  }
}
