import 'package:e_plant1/controllers/auth_controller.dart';
import 'package:e_plant1/view/auth/login.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class SignUpScreen extends GetResponsiveView {
 AuthController authController = Get.put(AuthController());

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "register",
          style:
              TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 0.2),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.to(LoginScreen());
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Add your details to register",
                    style: TextStyle(

                    ),
                  ),
                   GetBuilder<AuthController>(
              
                builder: (controller) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          authController.getImage(source: ImageSource.camera);
                          
                        },
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: CircleAvatar(
                            child:  controller.searchImage.value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                    controller.searchImage.value!,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 120,
                                    height: 120,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
                 SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color:Colors.black26,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                      controller: authController.nomcontroller,
                      keyboardType: TextInputType.text,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nom",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.black45,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // const Spacer(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color:Colors.black26,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                      controller: authController.prenomcontroller,
                      keyboardType: TextInputType.text,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Prénom",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.black45,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // const Spacer(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color: Colors.black26,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                     controller: authController.numTelcontroller,
                      keyboardType: TextInputType.phone,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "N° tél",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color:  Colors.black45,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // const Spacer(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color: Colors.black26,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                       controller: authController.emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.black45,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //const Spacer(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      color:Colors.black26,
                      shape: StadiumBorder(),
                    ),
                    child: TextField(
                      controller: authController.passwordcontroller,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color:Colors.black45,
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // const Spacer(),
                  // Container(
                  //   width: double.infinity,
                  //   height: 50,
                  //   // ignore: prefer_const_constructors
                  //   decoration: ShapeDecoration(
                  //     color:Colors.black26,
                  //     shape: StadiumBorder(),
                  //   ),
                  //   child: TextField(
                  //     obscureText: true,
                  //     controller: authController.passwordcontroller,
                  //     keyboardType: TextInputType.visiblePassword,
                  //     // ignore: prefer_const_constructors
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: "Confirm Password",
                  //       // ignore: prefer_const_constructors
                  //       hintStyle: TextStyle(
                  //         color: Colors.black45,
                  //       ),
                  //       contentPadding: EdgeInsets.all(12),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 100),
                  // const Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                       authController.registerClient();
                      },
                      child: const Text(
                        "Register ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("Have an account? "),
                        InkWell(
                          onTap: () {
                            Get.to(LoginScreen());
                          },
                          child:  Text(
                            "Login",
                            style: TextStyle(
                              color:Colors.green[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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