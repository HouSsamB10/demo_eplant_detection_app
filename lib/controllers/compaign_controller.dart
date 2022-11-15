import 'dart:math';

//import 'package:apptest/controllers/aicontroller.dart';

import 'package:e_plant1/controllers/ai_controller.dart';
import 'package:e_plant1/models/Compaign.dart';
import 'package:e_plant1/services/api/CompaignApi.dart';
import 'package:e_plant1/services/api/ProductApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';

import '../models/product.dart';
import '../models/product.dart';

class CompaignController extends GetxController {



  CompaignApi compaignApi = CompaignApi();
  RxBool isLoading = true.obs;
 var listComapiagns = [].obs;


  void fetchComapaign() async {
    try {
      isLoading(true);
      var compaigns = await compaignApi.getCompaign();
      if (compaigns != null) {
        listComapiagns.value = compaigns;
      }
    } finally {
      isLoading(false);
    }
  }

 
  @override
  void onInit() {
  fetchComapaign();

    super.onInit();
  }



}
