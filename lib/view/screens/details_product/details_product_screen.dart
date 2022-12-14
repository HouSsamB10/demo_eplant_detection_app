
import 'package:e_plant1/models/product.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../../controllers/cart_controller.dart';
import '../../../controllers/productcontroller.dart';


class ProductDetailsView extends StatelessWidget {
 Product product ;
 ProductDetailsView({required this.product});
var products = [
'assets/images/rose1.jpg',
'assets/images/rose2.jpeg',
'assets/images/rose4.jpg',

];

CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Ionicons.chevron_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.bag_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            padding: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
        
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: product.image != [] ?  NetworkImage(idoomadsl + product.image[0].toString() ) : NetworkImage('https://previews.123rf.com/images/grgroup/grgroup1802/grgroup180202344/95457313-bouquet-of-flowers-icon-vector-illustration-design.jpg?fj=1'),
              fit: BoxFit.fill,
            ),
          ),
       
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flower',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.title.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                             ' ${product.regular_price.toString()} DA',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque auctor consectetur tortor vitae interdum.',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Text(
                        //   'Similar This',
                        //   style: GoogleFonts.poppins(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        // SizedBox(
                        //   height: 110,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount:3,
                        //     itemBuilder: (context, index) => Container(
                        //       margin: const EdgeInsets.only(right: 6),
                        //       width: 110,
                        //       height: 110,
                        //       decoration: BoxDecoration(
                        //         color: AppColors.kSmProductBgColor,
                        //         borderRadius: BorderRadius.circular(20),
                        //       ),
                        //       child: Center(
                        //         child: Image(
                        //           height: 70,
                        //           image: AssetImage(products[index]),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.kGreyColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.kGreyColor),
              ),
              child: Icon(
                Ionicons.heart_outline,
                size: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: () {
                 cartController.addProductTocart(product.id);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                            '+ Add to Cart',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AppColors {
  static Color kBgColor = Colors.white;
  static Color kGreyColor = Colors.grey;
  static Color kSmProductBgColor = Colors.white;
}