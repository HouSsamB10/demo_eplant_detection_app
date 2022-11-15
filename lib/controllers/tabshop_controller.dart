import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopTabController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
