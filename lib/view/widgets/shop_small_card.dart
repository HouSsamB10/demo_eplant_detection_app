import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/shop_controller.dart';
import '../../models/shop.dart';
import '../screens/searchScreen/storeScreen/shop_details_screen.dart';


class ShopSmallCard extends StatelessWidget {
  Shop shop ;
  ShopSmallCard({required this.shop});
  @override
   final shopsController = Get.put(ShopController());
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          shopsController.getProductbyshop(shop.id!);
          Get.to( ShopDetailsScreen(shop: shop,)  );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:  DecorationImage(
                    image: NetworkImage(shop.url_logo.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          shop.shop_name.toString(),
                          style:TextStyle(
                            fontSize:14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children:  [
                              Icon(Icons.star, size: 18, color: Colors.orange),
                              SizedBox(
                                width: 2,
                              ),
                              Text(5.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         ' boumerdes',
                          style:TextStyle(
                            fontSize:12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        // starts
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
