import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class ContentProvider with ChangeNotifier{
  XFile? imageFileCaptured;
  String? generatedCaption;

  setImageFile(XFile file){
    imageFileCaptured = file;
    notifyListeners();
  }

  setCaption(String caption){
    generatedCaption = caption;
    notifyListeners();
  }

  clearProvider(){
    imageFileCaptured = null;
    generatedCaption = null;
    notifyListeners();
  }
}