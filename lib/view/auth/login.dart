import 'package:e_plant1/controllers/auth_controller.dart';
import 'package:e_plant1/view/auth/register.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class LoginScreen extends GetResponsiveView {
 AuthController authController = Get.put(AuthController());

  @override
  Widget? phone() {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: prefer_const_constructors
                  Center(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 66),
                  // Spacer(),
                  // ignore: prefer_const_constructors
                  Center(
                    child: const Text(
                      'Add your details to log in?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color:Colors.black12,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                      controller: authController.emailcontroller,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color:Colors.black12,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                      controller: authController.passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.black38,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 53),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                       authController.login();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("You do not have an account ? ",  style: TextStyle(
                          
                           
                            fontSize: 11,
                          ),),
                      InkWell(
                        onTap: () {
                           Get.to(SignUpScreen());
                        },
                        child:  Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.green[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}