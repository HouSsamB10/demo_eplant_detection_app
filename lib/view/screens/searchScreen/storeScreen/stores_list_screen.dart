import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/shop_controller.dart';
import '../../../widgets/shop_card.dart';

class MyListStores extends StatelessWidget {
      final shopsController = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
   
       
      child: RefreshIndicator(
          //  key: _refreshIndicatorKey,
                      color: Colors.white,
                      backgroundColor: Colors.green,
                      strokeWidth: 2.0,
                      onRefresh: () async {
                      shopsController.fetchShops();
                      return Future<void>.delayed(const Duration(seconds: 3));
                       },
        child: ListView.builder(
            itemCount: shopsController.listshops.length,
            itemBuilder: (context, index) {
              return ShopCard(  shopitem: shopsController.listshops[index],);
            }),
      ),
    );
  }
}
