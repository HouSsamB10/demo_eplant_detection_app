import 'package:e_plant1/controllers/onbording_controller.dart';
import 'package:e_plant1/view/screens/welcomeScreen/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class OnbordingScreen extends StatelessWidget {
  OnbordingController control = Get.put(OnbordingController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      height: 400,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: control.controller,
                        onPageChanged: (value) {
                          control.count.value = value;
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(control.pages[index]["image"]!);
                        },
                        itemCount: control.pages.length,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: control.count.value == 0
                              ? Colors.green
                              : Colors.white24,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: control.count.value == 1
                             ? Colors.green
                              : Colors.white24,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: control.count.value == 2
                              ? Colors.green
                              : Colors.white24,
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      control.pages[control.count.value]["title"]!,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      control.pages[control.count.value]["desc"]!,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.off(() => WelcomeScreenResponsive());
                          },
                          child: const Text(
                            "Suivant",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 2),
                          )),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}