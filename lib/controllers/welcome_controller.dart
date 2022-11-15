import 'package:e_plant1/view/screens/cartScreen/cart_screen.dart';
import 'package:e_plant1/view/screens/homeScreen/home_screen.dart';
import 'package:e_plant1/view/screens/searchScreen/search_screen.dart';
import 'package:e_plant1/view/screens/settingScreen/settings_screen.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  var currentIndex = 0.obs;
  var screens = [
    HomeScreenResponsive(),
    SearchScreenResponsive(),
    CartScreenResponsive(),
    SettingScreenResponsive(),
  ];
}
