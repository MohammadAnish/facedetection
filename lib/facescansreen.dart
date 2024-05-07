import 'dart:js';

import 'package:camera/camera.dart';
import 'package:face_detection/co_wid.dart';
import 'package:face_detection/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'MLService.dart';
import 'main.dart';

List<CameraDescription>? cameras;

class FaceScanScreen extends StatefulWidget {
  final User? user;
  const FaceScanScreen({Key? key, this.user}): super(key: key);

  @override
  State<FaceScanScreen> createState() => _FaceScanScreenState();
}

class _FaceScanScreenState extends State<FaceScanScreen> {
  TextEditingController Controller = TextEditingController();
  late CameraController _cameraController;
  bool flash = false;
  bool isControllerInitialized = false;
  late FaceDetector _faceDetector;
  final MLService _mlService = MLService();
  List<Face> faceDetected =[];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();

    Future initializeCamera() async {
      await _cameraController.initialize();
      isControllerInitialized = true;
      _cameraController.setFlashMode(FlashMode.off);
      setState(() {

      });
    }

    InputImageRotation rotationIntToImageRotation(int rotation){
      switch(rotation){
        case 90:
          return InputImageRotation.Rotation_90deg;
        case 180:
          return InputImageRotation.Rotation_90deg;
        case 270:
          return InputImageRotation.Rotation_90deg;
      }
    }
  }


}

Future<void> _predictFaceFromImage({required CameraImage image}) async{
  await detectFaceFromImage(image);
  var faceDetected;
  if(faceDetected.isNotEmpty){
    var widget;
    var controller;
    User? user = await _mlService.predict(
      image,
      faceDetected[0],
      widget.user!= null,
      widget.user !=- null? widget.user!.name! : controller.text);
    if(widget.user == null){
      Navigator.pop(context as BuildContext);
      print("User registered successfully");
    }
    else{
      Navigator.push(context as BuildContext,
      MaterialPageRoute(builder: (context)=> Home()));
    }
    )
  }

  bool mounted = true;
  if(mounted) setState(() {});
  await takePicture();
}

takePicture() {
}

void setState(Null Function() param0) {
}

mixin _mlService {
  static predict(CameraImage image, faceDetected, bool bool, param3) {}
}

detectFaceFromImage(CameraImage image) {
}
