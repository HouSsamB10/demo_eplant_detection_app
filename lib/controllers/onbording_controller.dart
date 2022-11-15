import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  late PageController controller;
  var count = 0.obs;

  @override
  void onInit() {
    controller = new PageController();
    super.onInit();
  }

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/1onbording.jpg",
      "title": "Achetez les meilleures plantes",
      "desc":
          "Découvrez les meilleurs plantes de nos pipinaire et une livraison rapide à votre porte"
    },
    {
      "image": "assets/images/2onbording.jpg",
      "title": "Fonction de reconnaissance des plantes",
      "desc": "Passez votre commande où que vous soyez"
    },
    {
      "image": "assets/images/3onbording.jpg",
      "title": "Livraison rapide",
      "desc":
          "Livraison de plante rapide à votre domicile, bureau où que vous soyez"
    },
  ];
}