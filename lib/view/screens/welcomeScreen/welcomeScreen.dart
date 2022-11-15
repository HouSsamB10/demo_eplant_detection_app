import 'package:e_plant1/controllers/ai_controller.dart';
import 'package:e_plant1/controllers/compaign_controller.dart';
import 'package:e_plant1/controllers/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/shop_controller.dart';
import '../imageDetectionScreen/aisearch.dart';

class WelcomeScreen extends StatelessWidget {
  final welcomeController = Get.put(WelcomeController());
  final aicontroller = Get.put(AiController());
     final compaignController = Get.put(CompaignController());
  final shopsController = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
 

    return Obx(
      () => Scaffold(
        body: welcomeController.screens[welcomeController.currentIndex.value],
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  icon: (welcomeController.currentIndex.value == 0)
                      ? const Icon(Icons.home, color: Colors.green)
                      : const Icon(Icons.home),
                  onPressed: () {
                    welcomeController.currentIndex.value = 0;
                  }),
              IconButton(
                  icon: (welcomeController.currentIndex.value == 1)
                      ? const Icon(Icons.view_agenda, color: Colors.green)
                      : const Icon(Icons.view_agenda),
                  onPressed: () {
                    welcomeController.currentIndex.value = 1;
                  }),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                  icon: (welcomeController.currentIndex.value == 2)
                      ? const Icon(Icons.add_shopping_cart, color: Colors.green)
                      : const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    welcomeController.currentIndex.value = 2;
                  }),
              IconButton(
                  icon: (welcomeController.currentIndex.value == 3)
                      ? const Icon(Icons.person, color: Colors.green)
                      : const Icon(Icons.person),
                  onPressed: () {
                    welcomeController.currentIndex.value = 3;
                  }),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(()=>AiScreen());
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 41, 146, 45),
                  Color.fromARGB(255, 96, 221, 160),
                ])),
            child: const Icon(Icons.filter_center_focus),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}
