import 'dart:math';

import 'package:e_plant1/view/widgets/menu/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/compaign_controller.dart';
import '../../../controllers/shop_controller.dart';
import '../../../models/shop.dart';
import '../../const.dart';
import '../../utils/appbar_widget.dart';
import '../../widgets/card_slider.dart';

import '../../widgets/shop_small_card.dart';
import '../settingScreen/UserTab.dart';

// var shoplist = [
//  Shop(image: 'assets/images/garden3.jpg',name:'Pépinière mohamed',ville:' Boumerdes 35 Center,Ville',stars:4),
//  Shop(image: 'assets/images/shop3.jpg',name:'Pépinière amine',ville:' Boumerdes 35 boudouaou',stars:3),
//   Shop(image: 'assets/images/shop4.jpg',name:'Pépinière brahim',ville:' Boumerdes 35 tijlabin',stars:2),
//    Shop(image: 'assets/images/shop5.jpg',name:'Pépinière fatiha',ville:' Boumerdes 35 thenia',stars:5),
//     Shop(image: 'assets/images/shop6.jpeg',name:'Pépinière walid',ville:' Boumerdes 35 corso',stars:1),

// ];

class HomeScreen extends StatelessWidget {
   final compaignController = Get.put(CompaignController());
      final shopsController = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // compaignController.listComapiagns.length;
    return Scaffold(
      drawer: Drawer1(),
      /*
      drawer: Drawer(
        child: UserTab(),
      ),
      */
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        backgroundColor: Colors.green[600],
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(50),
        //     bottomRight: Radius.circular(50),
        //   ),
        // ),
        // title: const Text(
        //   '',
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 25,
        //     letterSpacing: 1.5,
        //   ),
        // ),
        centerTitle: true,
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(blurRadius: 40.0),
        //     ],
        //     // image: DecorationImage(
        //     //   image: ExactAssetImage('assets/images/image_31.jpg'),
        //     //   fit: BoxFit.fitWidth,
        //     // ),
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(50),
        //       bottomRight: Radius.circular(50),
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
          ButtonSearch(),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(()=>
             Padding(
                padding:  EdgeInsets.all(15.0),
                child:  compaignController.isLoading.value ? Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Center( child: CircularProgressIndicator(),),)  : CardSlider(balanceCards:    compaignController.listComapiagns.value)
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0),
            //   child: _buildSection('Top Categories', theme),
            // ),
            const SizedBox(height: 10),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.1,
            //   width: double.infinity,
            //   child: ListView.builder(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: categoryImage.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         elevation: 3,
            //         child: Container(
            //             clipBehavior: Clip.hardEdge,
            //             width: MediaQuery.of(context).size.width * 0.30,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //                 image:
            //                     ExactAssetImage(categoryImage[index]['image']),
            //                 fit: BoxFit.fill,
            //               ),
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.white,
            //             ),
            //             child: Positioned(
            //               top: 0,
            //               left: 0,
            //               right: 0,
            //               bottom: 0,
            //               child: Container(
            //                 height: 80,
            //                 decoration: BoxDecoration(
            //                   color: Colors.black.withAlpha(110),
            //                 ),
            //                 child: const Center(
            //                   child: Text(
            //                     'category',
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       letterSpacing: 1.5,
            //                       fontSize: 16,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             )),
            //       );
            //     },
            //   ),
            // ),
            // const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: _buildSection('shops', theme),
            ),
            const SizedBox(height: 5),
            Obx(()=>
              //  Column(
              //   children: [
              //     // card shop items
              //     ShopSmallCard( shop: shopsController.listshops[0],),
              //     //   ShopSmallCard( shop: shoplist[1],),
              //     //     ShopSmallCard( shop: shoplist[2],),
              //     //       ShopSmallCard( shop: shoplist[3],),
              //     //         ShopSmallCard( shop: shoplist[4],),
                 
              //   ],
              // ),
           
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                child:  shopsController.isLoading.value ?  Center( child: CircularProgressIndicator(),) : 
                 RefreshIndicator(
                  //  key: _refreshIndicatorKey,
                      color: Colors.white,
                      backgroundColor: Colors.green,
                      strokeWidth: 2.0,
                      onRefresh: () async {
                      shopsController.fetchShops();
                      return Future<void>.delayed(const Duration(seconds: 3));
                       },
       
                  child: ListView.builder(
                  itemCount:shopsController.listshops.length ,
                  itemBuilder: (context , index) {
                  return   ShopSmallCard( shop: shopsController.listshops[index],);
                              }),
                ),),
            ),
             SizedBox(height: 20),
          ],
        )),
      ),
    );
  }

  Widget _buildSection(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 50,
            splashColor: theme.primaryColor.withAlpha(10),
            highlightColor: theme.primaryColor.withAlpha(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            child: Icon(
              Icons.arrow_right,
              size: 20,
              color: theme.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
