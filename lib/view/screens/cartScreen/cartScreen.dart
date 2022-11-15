// ignore_for_file: prefer_const_constructors

import 'package:e_plant1/controllers/auth_controller.dart';
import 'package:e_plant1/controllers/cart_controller.dart';
import 'package:e_plant1/models/cartItem.dart';
import 'package:e_plant1/models/product.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:e_plant1/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class OneCart extends StatefulWidget {
  const OneCart({Key? key}) : super(key: key);

  @override
  State<OneCart> createState() => _OneCartState();
}

class _OneCartState extends State<OneCart> {
  CartController cartController = Get.put(CartController(),permanent: true);
    AuthController authController = Get.put(AuthController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
        body: cartController.isLoading.value ?  Center(child: CircularProgressIndicator())   :   Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
                     
             GetBuilder<AuthController>(

                builder:(controller) =>  Column(
                  children: [
                    _title(),
                authController.userVendor == null ?  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Center(
                        child: InkWell(
      onTap: () {
       
       Get.to(LoginScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Color.fromARGB(200, 83, 177, 117),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            // Text(
            //      "${cartController.total.value.toString()} DA",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600),
            //     ),
             
            
          ],
        ),
      ),
    ),
                      ),
                      )   :    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child:RefreshIndicator(
                       // key: _refreshIndicatorKey,
                        color: Colors.white,
                        backgroundColor: Colors.green,
                        strokeWidth: 2.0,
                        onRefresh: () async {
                        cartController.fetchCarts();
                        return Future<void>.delayed(const Duration(seconds: 3));
                         },
                     
                        child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: cartController.cartList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return OneProduct1(cartController.cartList[index]);
                        }
                      ),
                      ),
                      /*
                       SingleChildScrollView(
                        child: Column(
                          children: [
                            _OneProduct1(),
                            _OneProduct1(),
                            _OneProduct1(),
                            _OneProduct1(),
                            _OneProduct1(),
                          ],
                        ),
                      ),
                      */
                    ),
                  ],
                ),
              ),
                         
             GetBuilder<AuthController>(

                builder:(controller) => controller.userVendor == null ? Container()  : Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 30,
                      ),
                      child: _drawLongButton(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget OneProduct1(cartItem cartItem) {
    print(cartItem.product!.image);
    return 
       Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.20,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cartItem.product!.image != [] ? 
                 Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(
                     idoomadsl + cartItem.product!.image[0].toString() ))),
        ) :   Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                // fit: BoxFit.contain,
                  image: NetworkImage(
                   'https://salisburygreenhouse.com/wp-content/uploads/Header-_0162_Top-10-Plants-That-Make-You-Happy-feature.jpg' ))),
        ),
              /*  const SizedBox(
                  child: Image(
                    width: 100,
                    height: 100,
                   // image: ExactAssetImage('assets/images/1.png'),
                   image: NetworkImage(
                      url + authController.userVendor.avatar_url!),
                    fit: BoxFit.contain,
                  ),
                ),
                */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cartItem.product!.title.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                          // overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            " Flowers",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(124, 124, 124, 1)),
                          ),
                        ),
                        Text(
                         "${cartItem.product!.sale_price!.toString()} DA",
                          style: TextStyle(
                            color: Color.fromRGBO(24, 23, 37, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              cartController.removeproductIncart(cartItem.id);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(
                                      color: Color.fromRGBO(240, 240, 240, 1))),
                              child: Image(
                                  image:
                                      ExactAssetImage("assets/images/minus.png")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              cartItem.quantity.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(24, 23, 37, 1)),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                                cartController.addProductTocart(cartItem.product!.id);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(
                                      color: Color.fromRGBO(240, 240, 240, 1))),
                              child: Image(
                                  image: ExactAssetImage("assets/images/add.png")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topRight,
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: Color.fromRGBO(179, 179, 179, 1),
                    size: 28,
                  ),
                )
              ],
            ),
            _divider(),
          ],
        ),
      
    );
  }

  Widget _OneProduct2() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            child: Image(
              width: 100,
              height: 100,
              image: ExactAssetImage('assets/images/2.png'),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, bottom: 10, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Hmoud Boisson",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.1,
                            ),
                          ),
                          Text(
                            "Gazeuse 1L",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(124, 124, 124, 1)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Color.fromRGBO(179, 179, 179, 1),
                          size: 28,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                    color: Color.fromRGBO(240, 240, 240, 1))),
                            child: Image(
                                image: ExactAssetImage("assets/minus.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(24, 23, 37, 1)),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                    color: Color.fromRGBO(240, 240, 240, 1))),
                            child:
                                Image(image: ExactAssetImage("assets/add.png")),
                          ),
                        ],
                      ),
                      Text(
                        "120 DA",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 23, 37, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _OneProduct3() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            child: Image(
              width: 100,
              height: 100,
              image: ExactAssetImage('assets/images/3.png'),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, bottom: 10, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Canette Selecto Boisson",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.1,
                            ),
                          ),
                          Text(
                            "Gazeuse 33 Cl",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(124, 124, 124, 1)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Color.fromRGBO(179, 179, 179, 1),
                          size: 28,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                    color: Color.fromRGBO(240, 240, 240, 1))),
                            child: Image(
                                image: ExactAssetImage("assets/minus.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(24, 23, 37, 1)),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                    color: Color.fromRGBO(240, 240, 240, 1))),
                            child:
                                Image(image: ExactAssetImage("assets/add.png")),
                          ),
                        ],
                      ),
                      Text(
                        "120 DA",
                        style: TextStyle(
                          color: Color.fromRGBO(24, 23, 37, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 2,
      color: Color.fromRGBO(226, 226, 226, 1),
    );
  }

  Widget _title() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.14,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "Panier",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(24, 23, 37, 1),
                  fontSize: 20,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Color.fromRGBO(226, 226, 226, 1),
        )
      ],
    );
  }

  Widget _drawLongButton() {
    return InkWell(
      onTap: () {
       
        Get.defaultDialog(
            title: "Oops!",
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: prefer_const_constructors

                // ignore: prefer_const_constructors
                Image(
                  image:  ExactAssetImage('assets/images/order_success.jpg'),
                  fit: BoxFit.cover,
                  height: 200,
                ),

                // ignore: prefer_const_constructors
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 8, top: 8),
                //   child: Text(
                //     "Oops! Order Failed",
                //     style: const TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                // ignore: prefer_const_constructors
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 8),
                //   child: Text(
                //     "Something went tembly wrong.",
                //     style: const TextStyle(
                //       fontSize: 13,
                //       fontWeight: FontWeight.normal,
                //       color: Color.fromRGBO(124, 124, 124, 100),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    primary: Color.fromRGBO(83, 177, 117, 1), // background
                    onPrimary: Colors.white,
                    // foreground
                  ),
                  onPressed: () {
                     cartController.makeOrder();
                  },
                  child: Text('Order Now'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white, // background
                    onPrimary: Colors.black, // foreground
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Back '),
                )
              ],
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.88,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(200, 83, 177, 117),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "Passer Commande",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            Text(
                 "${cartController.total.value.toString()} DA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
             
            
          ],
        ),
      ),
    );
  }
}
