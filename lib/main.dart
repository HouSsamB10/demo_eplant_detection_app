import 'package:e_plant1/controllers/onbording_controller.dart';
import 'package:e_plant1/view/screens/splash_screen.dart';
import 'package:e_plant1/view/themes/Themes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    OnbordingController control = Get.put(OnbordingController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-plant',
      theme: Themes.lightTheme,
      // darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
