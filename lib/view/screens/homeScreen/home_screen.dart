import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'homeScreen.dart';

class HomeScreenResponsive extends GetResponsiveView {
  @override
  Widget? phone() {
    return HomeScreen();
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
