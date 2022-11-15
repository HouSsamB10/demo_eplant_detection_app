import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'UserTab.dart';

class SettingScreenResponsive extends GetResponsiveView {
  @override
  Widget? phone() {
    return Scaffold(
      body: UserTab(), // Text('data'),
    );
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
