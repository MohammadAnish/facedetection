import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:face_detection/lo_db.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;
import 'package:face_detection/models/user.dart';
import 'package:face_detection/utils.dart';
//import 'image_converter.dart';

class MLService{
  late Interpreter interpreter;
  List? predictedArray;

  List? get userArray => null;

  Future<User?> predict(
      CameraImage cameraImage, Face face, bool loginUser, String name)
  async{
    List input = _preProcess(cameraImage, face) as List;

    input = input.reshape([1,112,112,3]);
    List output = List.generate(1, (index) => List.filled(192,0));

    await initializeInterpreter();

    interpreter.run(input, output);
    output = output.reshape([192]);
    predictedArray = List.from(output);

    if(!loginUser){
      lo_db.setUserDetails(User(name: name, array: predictedArray));
      return null;

    }
else{
  User? user = lo_db.getUser();
  List userArrat = user.array!;
  int minDist = 999;
  double threshold= 1.5;
  var dist = euclideanDistance(predictedArray!, userArray!);
  if (dist <= threshold && dist < minDist){
    return user;
  }
  else{
    return null;
  }
    }

  }
}

class _preProcess {
  _preProcess(CameraImage cameraImage, Face face);
}

euclideanDistance(List l1,List l2 ){
  double sum = 0;
  for(int i = 0 ; i < l1.length;i++){
    sum += pow((l1[i]-l2[i]),2);

  }
  return pow(sum,0.5);
}

initializeInterpreter()async{
  Delegate? delegate;
  try{
    if(Platform.isAndroid){
      var fastSingleAnswer;
      
      delegate = GpuDelegateV2(
        options: GpuDelegateOptionsV2(
          isPrecisionLossAllowed: false,
          inferencePreference: IfLiteGpuInfernceUsage.,
          
        )
      );
    }
  }
  catch{

  }
}

class IfLiteGpuInfernceUsage {
}