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
import '../services/api/shopsApi.dart';

class ShopController extends GetxController {



  ShopApi shopApi = ShopApi();
  ProductApi productApi = ProductApi();
  RxBool isLoading = true.obs;
 var listshops = [].obs;
  RxList<Product?> listProducts = RxList<Product>.empty();


  void fetchShops() async {
    try {
      isLoading(true);
      var shops = await shopApi.getCompaign();
      if (shops != null) {
        listshops.value = shops;
      }
    } finally {
      isLoading(false);
    }
  }

    void getProductbyshop(int id ) async {
    try {
      isLoading(true);
      var products = await productApi.getProducts(id);
      if (products != null) {
        
        listProducts.value = products;
        print(listProducts);
      }
    } finally {
      isLoading(false);
    }
  }

 
  @override
  void onInit() {

  fetchShops();
    super.onInit();
  }



}
