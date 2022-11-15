import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MytabsController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController controller;

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'CATEGORIES',
    ),
    Tab(
      text: 'STORES',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(
      initialIndex: 0,
      length: myTabs.length,
      vsync: this,
    );
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
