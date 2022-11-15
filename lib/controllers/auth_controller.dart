import 'dart:io';

import 'package:e_plant1/models/user.dart';
import 'package:e_plant1/services/api/authApi.dart';
import 'package:e_plant1/view/auth/login.dart';
import 'package:e_plant1/view/screens/onbordingScreen/onbordingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../view/screens/welcomeScreen/welcome_screen.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  
  final Rx<File?> searchImage = Rx(null);
  String? imagePath ;
     
 

   final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();


  final nomcontroller = TextEditingController();
  final prenomcontroller = TextEditingController();
  final numTelcontroller = TextEditingController();
  // final emailcontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();

  AuthApi auth = new AuthApi();
  RxBool isLoading = true.obs;
  late User? userVendor ;




    void getImage({ImageSource source = ImageSource.camera}) async {
    var image = await ImagePicker().pickImage(source: source);
    //  var image = await FilePicker.platform.pickFiles(type: FileType.image);
    if (image != null) {
      searchImage.value = File(image.path);
      imagePath = image.path;
      update();
    }else{
      searchImage.value = null;
         }
      }
  


  login() async {
    List<String> emailPssword = [];
    emailPssword.add(emailcontroller.text);
    emailPssword.add(passwordcontroller.text);
    try {
      isLoading(true);
      var user = await auth.login(emailPssword);
      if (user != null) {
        userVendor = user;
         Get.off(() => WelcomeScreenResponsive());
         update();
      
      } else {
        emailcontroller.text = '';
        passwordcontroller.text = '';
        Get.offAll(LoginScreen());
      }
    } finally {
      isLoading(false);
    }
  }

   register() async {
    List<String> emailPssword = [];
    emailPssword.add(emailcontroller.text);
    emailPssword.add(passwordcontroller.text);
    try {
      isLoading(true);
      var user = await auth.login(emailPssword);
      if (user != null) {
        userVendor = user;
         Get.off(() => WelcomeScreenResponsive());
          update();
      } else {
        emailcontroller.text = '';
        passwordcontroller.text = '';
        Get.offAll(LoginScreen());
      }
    } finally {
      isLoading(false);
    }
    
   }

    void videAll() {
    nomcontroller.text = '';
    prenomcontroller.text = '';
    numTelcontroller.text = '';
    emailcontroller.text = '';
    passwordcontroller.text = '';
  }

  registerClient() async {
    try {
      isLoading(true);
      User addUser = new User(id: null, firstname: nomcontroller.text, lastname:  prenomcontroller.text,password: passwordcontroller.text, email: emailcontroller.text, phone_number: numTelcontroller.text, avatar_url: null,);

      var user1 = await auth.registerClient(addUser , searchImage.value! );
      print(user1);

      if (user1 != null  ) {
        videAll();
        userVendor = user1;
        update();
        Get.to(WelcomeScreenResponsive());
        return true;
      } else {
        return false;
      }
    } finally {
      isLoading(false);
    }
  }



  logout() async {
    try {
      isLoading(true);
      var user = await auth.logout();
      if (user != null) {
        emailcontroller.text = '';
        passwordcontroller.text = '';
        userVendor = null;
        update();
        Get.to(WelcomeScreenResponsive());
      } else {
        Get.snackbar('logout', 'error');
      }
    } finally {
      isLoading(false);
    }
  }
    Future<void> redirect() async {
    var token = await GetStorage().read('login_token');
    // print(token);
    if (token != null) {
      isLoggedIn.value = true;
    }

    // go to ....... 5 seconds

    Future.delayed(const Duration(seconds: 5)).then((value) {
      // await 5 seconds
      //  Get.off(() => WelcomeScreenResponsive());
        // Get.off(() => OnbordingScreen());
      Get.off(() => LoginScreen());
    }).catchError((error) {
      print('${error.toString}');
    });
  } 

  @override
  void onInit() {
    emailcontroller.text = '';
    passwordcontroller.text = '';
    // TODO: implement onInit
     redirect();
    super.onInit();
  }   


//end of redirect

}
//end of controller
