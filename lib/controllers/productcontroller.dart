import 'dart:math';

//import 'package:apptest/controllers/aicontroller.dart';

import 'package:e_plant1/controllers/ai_controller.dart';
import 'package:e_plant1/services/api/ProductApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';

import '../models/product.dart';
import '../models/product.dart';

class ProductController extends GetxController {
  AiController aiController = Get.put(AiController());

  RxString controllercategory = ''.obs;
  ProductApi productApi = ProductApi();
  RxBool isLoading = true.obs;
  var productList = [Product(id: 1, description: 'description', title: 'rose', regular_price: '800 DA', discount: 'discount', qty: 'qty', sale_price: 'sale_price', type: 'type', image: ['https://www.floraqueen.com/blog/wp-content/uploads/2020/02/shutterstock_552296878.jpg']),
  Product(id: 1, description: 'description', title: 'rose', regular_price: '400 DA', discount: 'discount', qty: 'qty', sale_price: 'sale_price', type: 'type', image: ['https://emova-aunomdelarose-storage.omn.proximis.com/Imagestorage/imagesSynchro/740/740/66974175b411477948576a1de265c8c697e7d740_giulianaFP5.jpg'])
  ].obs;
  late Product product;
/*
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await productApi.getProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
*/
  void searchProducts(String tag) async {
    try {
      isLoading(true);
      var products = await productApi.searchProducts(tag);
      if (products != null) {
        productList.value = products;
        
      }
    } finally {
      isLoading(false);
    }
  }
/*
  deleteProduct(int id) async {
    var is_deleted = await productApi.deleteProduct(id);
    if (is_deleted == true) {
      fetchProducts();
      return true;
    } else {
      return false;
    }
  }
*/

  @override
  void onInit() {
  //  fetchProducts();

    super.onInit();
  }



}
