import 'package:e_plant1/view/screens/welcomeScreen/welcomeScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WelcomeScreenResponsive extends GetResponsiveView {
  @override
  Widget? phone() {
    return WelcomeScreen();
  }

  @override
  Widget? tablet() {
    return phone();
  }

  @override
  Widget? desktop() {
    return phone();
  }
}
