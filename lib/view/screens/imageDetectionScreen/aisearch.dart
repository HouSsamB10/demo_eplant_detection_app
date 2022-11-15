library home;

import 'dart:io';
import 'dart:math';

import 'package:e_plant1/controllers/ai_controller.dart';
import 'package:e_plant1/controllers/productcontroller.dart';
import 'package:e_plant1/models/product.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../const.dart';

import '../../widgets/shop_card.dart';
import '../details_product/details_product_screen.dart';
import '../searchScreen/storeScreen/stores_list_screen.dart';
//import 'dart:html';

class AiScreen extends GetView<AiController> {
  ProductController productController = Get.put(ProductController());
   // AiController aiController = Get.put(AiController());
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: RefreshIndicator(
        onRefresh: () async => controller.random(),
        child: SafeArea(
          child:  CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: 20),
                      _SearchField(
                        controller: controller.searchKeyword,
                        onSubmitted: (value) => controller.searchByKeyword(),
                        onPressedImage: () => _showBottomSheetPickImage(),
                      ),
    /*
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: _SearchQuery(
                          value: controller.searchQuery.value,
                          image: controller.searchImageQuery.value,
                        ),
                      ),
    */
                      const Divider(thickness: 1, height: 50),
                      (controller.isLoading.value)
                          ? const Center(
                              child: Padding(
                              padding: EdgeInsets.all(20),
                              child: CircularProgressIndicator(),
                            ))
                          : Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.85,
                              child: productController.isLoading.value 
                                  ? Center(child: Text('search data '))
                                  : products(context),
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      
    );
  }

  Widget products(BuildContext context) {
  
    return Obx(()=>
     productController.isLoading.value  ?  Center(child: CircularProgressIndicator(),)   :     Container(
          padding: const EdgeInsets.only(
            right: 16,
            top: 16,
            left: 16,
          ),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            children: productController.productList.map((index) {
             print(index.image[0].toString());
              return productItem(
                title: index.title.toString(),
                image: index.image[0].toString(),
                price: index.regular_price,
                isFavorited: Random().nextBool(),
product: index,
              );
            }).toList(),
          )),
    );
  }

  Widget productItem(
      {String title = 'product1',
      image = 'image',
      price,
      bool isFavorited = true,required Product product}) {
    return InkWell(
    onTap: () {
       Get.to(ProductDetailsView(product: product,));
    },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(100, 25)),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(idoomadsl + image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: isFavorited
                              ? Colors.pink.shade100
                              : Colors.grey.shade400,
                        ),
                        child: Icon(Icons.favorite,
                            color: isFavorited ? Colors.pink : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '$title',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$$price',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade400,
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheetPickImage() {
    Get.bottomSheet(
      Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "select image from",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          if (Get.isBottomSheetOpen ?? false) Get.back();
                          controller.searchByImage(source: ImageSource.camera);
                        }),
                    const Text("Camera")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: () {
                        if (Get.isBottomSheetOpen ?? false) Get.back();
                        controller.searchByImage(source: ImageSource.gallery);
                      },
                    ),
                    const Text("Gallery")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isDismissible: true,
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField(
      {required this.controller,
      required this.onSubmitted,
      required this.onPressedImage,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final Function(String value) onSubmitted;
  final Function() onPressedImage;

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    AiController aiController = Get.put(AiController());
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined),
                hintText: "search post",
                isDense: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(Get.context!).primaryColor),
                ),
              ),
              onSubmitted: (value) => onSubmitted(value),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            productController.searchProducts(aiController.searchKeyword.text);
          },
          tooltip: "search ",
        ),
        IconButton(
          icon: const Icon(Icons.image_search),
          onPressed: () => onPressedImage(),
          tooltip: "search by image",
        ),
      ],
    );
  }
}

class _SearchQuery extends StatelessWidget {
  const _SearchQuery({this.image, this.value, Key? key}) : super(key: key);

  final File? image;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (image != null && value != null) {
      return Row(
        children: [
          _searchImage(image!),
          const SizedBox(width: 10),
          _searchText("Searching : '$value'"),
        ],
      );
    } else if (image != null) {
      return _searchImage(image!);
    } else if (value != null) {
      return _searchText("Searching for '$value'");
    } else {
      return Container();
    }
  }

  Widget _searchImage(File fileImage) {
    return Image.file(
      fileImage,
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    );
  }

  Widget _searchText(String value) {
    return Text(
      value,
      style: Theme.of(Get.context!).textTheme.caption!.copyWith(
            fontStyle: FontStyle.italic,
          ),
      textAlign: TextAlign.center,
    );
  }
}
