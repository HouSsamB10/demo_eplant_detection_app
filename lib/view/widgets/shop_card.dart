import 'package:e_plant1/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/shop_controller.dart';
import '../const.dart';
import '../screens/searchScreen/storeScreen/shop_details_screen.dart';

class ShopCard extends StatelessWidget {
  Shop shopitem;
ShopCard({required this.shopitem});

 final shopsController = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          shopsController.getProductbyshop(shopitem.id!);
          Get.to(() => ShopDetailsScreen(shop: shopitem, ));
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:  DecorationImage(
                    image:  NetworkImage(shopitem.url_logo.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          shopitem.shop_name.toString(),
                          style: theme.textTheme.headline6,
                        ),
                        // starts
                        Row(
                          children: icons,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '103B , SBI Building',
                          style: theme.textTheme.subtitle1?.copyWith(
                              letterSpacing: 1.5, fontWeight: FontWeight.w500),
                        ),
                        // starts
                        Text(
                          'Visit Store',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
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
