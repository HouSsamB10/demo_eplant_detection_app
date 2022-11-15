import 'dart:math';
import 'package:e_plant1/controllers/tabshop_controller.dart';
import 'package:e_plant1/models/product.dart';
import 'package:e_plant1/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/productcontroller.dart';
import '../../../../controllers/shop_controller.dart';
import '../../../../services/api/urlConst.dart';

import '../../../const.dart';
import '../../details_product/details_product_screen.dart';

class ShopDetailsScreen extends StatelessWidget {
  Shop shop ;
   ShopDetailsScreen({required this.shop});

  ShopTabController shoptabs = Get.put(ShopTabController());
  Profile profile = ProfileProvider.profile();
  
   final shopsController = Get.put(ShopController());
     ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {


    final theme = Theme.of(context);
    return  Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image:NetworkImage(shop.url_cover.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            // title: const Text(
            //  'Pépinière mohamed',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22 - 80),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeMode.system == ThemeMode.dark
                    ? Colors.black
                    : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                child: _tabBarContent(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabBarContent(BuildContext context) {
    return Column(
      children: [
        Container(
          child:  Text(
              shop.shop_name.toString(),
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
        ),
         Container(
          child: const Text(
              'Boumerdes 35 Center,Ville',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey.shade200),
          )),
          child: TabBar(
            labelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Colors.grey.shade400,
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            indicatorWeight: 3,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 14),
            controller: shoptabs.tabController,
            tabs: const [
              Tab(
                text: 'Products',
              ),
              Tab(
                text: 'Reviews',
              ),
              Tab(
                text: 'Contacts',
              ),
            ],
          ),
        ),
      Obx(()=>
         Flexible(
            child: TabBarView(
              controller: shoptabs.tabController,
              children: [
                _products(context),
                _reviews(context),
                _contacts(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _products(BuildContext context) {
    print(shopsController.listProducts.length.toString());
    return 
     shopsController.isLoading.value  ?  Center(child: CircularProgressIndicator(),)   :       Container(
          
          padding:  EdgeInsets.only(
            right: 16,
            top: 16,
            left: 16,
          ),      
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            children: shopsController.listProducts.map((products) {
          
              return productItem(
                title: products!.title.toString(),
                image: shopsController.listProducts[0]!.image.toString(),
                price: products.regular_price,
                isFavorited: Random().nextBool(),
                product: products, 
              );
            }).toList(),
    
              //  [
              //    productItem(
              //   title: product[0].title,
              //   image: product[0].image,
              //   price: product[0].price.toString(),
              //   isFavorited: Random().nextBool(),
              // ),
              //  productItem(
              //   title: product[1].title,
              //   image: product[1].image,
              //   price: product[1].price.toString(),
              //   isFavorited: Random().nextBool(),
              // ),
              //    productItem(
              //   title: product[2].title,
              //   image: product[2].image,
              //   price: product[2].price.toString(),
              //   isFavorited: Random().nextBool(),
              // ),
              // ],
           
          ),
    );
  }
    Widget productItem2(
      {String title = 'product1',
      image = 'image',
      price,
      bool isFavorited = true}) {
    return Container(
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
                            image: NetworkImage(idoomadsl+image),
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
    );
  }


  Widget productItem(
      {required String title,required String? image, price, required bool isFavorited , required Product product}) {
    return InkWell(
      onTap: (){

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
                              image: NetworkImage(idoomadsl + product.image[0].toString()),
                              fit: BoxFit.fill,
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
                    '${price} DA',
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

  Widget _reviews(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _cardHeader(),
                _drawTitle(),
              ],
            ),
          );
        });
  }

  Widget _cardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/houssam.jpg'),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Hou Ssam',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Fri,12 May 2017 * 14.30',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: icons,
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: Text('We also talk about the future of work as the robots'),
    );
  }

  // tabs bar view content

  Widget _contacts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          //  const CircleAvatar(
          //   radius: 70,
          //   backgroundImage: AssetImage('assets/avatar.jpg'),
          // ),
          //  const SizedBox(
          //    height: 25,),
          //   Center(child: Text(
          //   ' contact.name' ,
          //    style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600))),
          //   Center(
          //     child: Text(
          //    'hhhhh',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.normal))),
          //  const SizedBox(height:30,),
           Container(
color: const Color(0xff9AADBE),
child: Column(
  children: [
    ListTile(
      title: const Text('Mobile', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
      subtitle:  Text(
        'contact.phone', 
      style:
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
      color: Color(0xf3333333)),), 
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(onPressed: (){}, child: const Icon(Icons.message,color:Colors.black,),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder()
          ),),
          TextButton(onPressed: (){}, child: const Icon(Icons.call,color:Colors.black,),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder() ),
          ),
        ],)
    ),
     ListTile(
      title: const Text('Email', 
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
      subtitle: Text(
       ' contact.email', 
      style: 
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
      color: Color(0xf3333333)),), 
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(onPressed: (){}, child: const Icon(Icons.email,color:Colors.black,),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const CircleBorder()
          ),
          ),
        ],
        )
    ),
    // const  ListTile( 
    //   title: Text('Group', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
    //   subtitle: Text('Uni Friends', 
    //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
    //   color: Color(0xff9AADBE)),), 
    // ),
  ],
),
),
    
     Container(
       color: const Color(0xff9AADBE),
       child: Column(
         children: const [
           ListTile(
             title: Text('Share Contact', style: TextStyle(fontSize: 18),),
           ),
            ListTile(
             title: Text('QR Code', style: TextStyle(fontSize: 18),),
           )
         ],
       ),)
        ],)

    );
  }
}
