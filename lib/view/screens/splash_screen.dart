import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.green,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Text('plant Strore',
            //     style: TextStyle(
            //       fontSize: 35,
            //       color: Colors.green,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 1.5,
            //     )),
            const SizedBox(height: 100),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width * 0.80,
              child: Image.asset('assets/images/logo.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
