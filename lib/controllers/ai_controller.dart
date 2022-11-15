import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:e_plant1/controllers/productcontroller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';



class AiController extends GetxController {
  // final _unsplashService = UnsplashService();
  final searchKeyword = TextEditingController();
  final isLoading = false.obs;
  final Rx<String?> searchQuery = Rx(null);
  final Rx<File?> searchImageQuery = Rx(null);
  //final unsplashData = Rx<List<Unpslash>?>(null);

  @override
  void onInit() {
    random();
    _loadModel();
    super.onInit();
  }

  void searchByImage({ImageSource source = ImageSource.camera}) async {
    var image = await ImagePicker().pickImage(source: source,maxHeight:224 ,maxWidth: 224);
    //  var image = await FilePicker.platform.pickFiles(type: FileType.image);
    
    
    if (image != null) {
      /*
      CroppedFile? _image = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
             */
      /*
      final _image = await ImageCropper.cropImage(
        sourcePath: image.path,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'adjust image',
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        maxHeight: 224,
        maxWidth: 224,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );
     
      */

      if (image != null) {
        // update the current search image query information
        searchImageQuery.value = File(image.path);
        print(searchImageQuery.value);
        // get label from picked image

        _getImageClassificationLabel(searchImageQuery.value!).then(
          (value) {
            // search by label when image is fine :D
            print('value : ${value}');
            if (value != null) _search(value);
          },
        );
      } else {
        searchImageQuery.value = null;
      }
    } else {
      searchImageQuery.value = null;
    }
  }

  void searchByKeyword() {
    // remove previous search query by image
    searchImageQuery.value = null;

    _search(searchKeyword.text);

    // reset keyword field value when request processed
    searchKeyword.text = "";
  }

  /// get data from `Unsplash` by search
  void _search(String value1) async {
    // update the current search query information
    searchQuery.value = value1;
    searchKeyword.text = searchQuery.value!;

    isLoading.value = true;
    //  unsplashData.value = await _unsplashService.search(value, perPage: 20);
    isLoading.value = false;
  }

  /// get random data from `Unsplash`
  void random() async {
    // remove all previous search queries
    searchQuery.value = null;
    searchImageQuery.value = null;
    searchKeyword.text = '';
    isLoading.value = true;
    // unsplashData.value = await _unsplashService.random();
    isLoading.value = false;
  }

  /// load custom model
  void _loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_classification.tflite",
      labels: "assets/label.txt",
      numThreads: 1, // defaults to 1
  isAsset: true, // defaults to true, set to false to load resources outside assets
  useGpuDelegate: false ,
    );
  }

  /// get label from image, using image classification tensorflow lite
  Future<String> _getImageClassificationLabel(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      // imageMean: 0,
      // imageStd: 255,
    );




  //     var res = await Tflite.runModelOnImage(
  //     path: file.path,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //     numResults: 1
  //   );
  //  print(res);
    // print(res?[0]['label']);
    // print(res?[1]['label']);
    // print(res?[2]['label']);
    // print(res?[3]['label']);
    // print(res?[4]['label']);
  
    print(res?[0]["confidence"].toStringAsFixed(3));
    print(res);
    print( res?[0]["label"]);
  
    String str =  res?[0]["label"];
    String result = str.replaceAll(RegExp('[^A-Za-z]'), '');
    print(result); 


    return result;
    // return res?[0]['label'];
  }

  @override
  void onClose() {
    Tflite.close();
    super.onClose();
  }
}
