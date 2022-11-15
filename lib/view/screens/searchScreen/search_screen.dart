import 'package:e_plant1/controllers/mytabs_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categorySCreen/category_screen.dart';
import 'storeScreen/stores_screen.dart';

class SearchScreenResponsive extends GetResponsiveView {
  MytabsController mytabs = Get.put(MytabsController());
  static Color _TextColor = Colors.green;
  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: ExactAssetImage(
        //         'assets/images/background3.png',
        //       ),
        //       fit: BoxFit.cover,
        //     ),
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(20),
        //       bottomRight: Radius.circular(20),
        //     ),
        //     gradient: LinearGradient(
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         colors: <Color>[
        //           Color.fromARGB(255, 41, 146, 45),
        //           Color.fromARGB(255, 96, 221, 160),
        //         ]),
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_pin_circle),
            ),
          ),
        ],
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.6,
          ),
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 14),
          controller: mytabs.controller,
          tabs: const <Tab>[
            Tab(text: 'categories'),
            Tab(text: 'stores'),
          ],
        ),
      ),
      body: TabBarView(
        controller: mytabs.controller,
        children: [
          CategoryScreen(),
          StoreScreen(),
        ],
      ),
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
