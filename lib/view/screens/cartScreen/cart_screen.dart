import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cartScreen.dart';

class CartScreenResponsive extends GetResponsiveView {
  @override
  Widget? phone() {
    return  OneCart();
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
