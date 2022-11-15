import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:e_plant1/models/cart.dart';
import 'package:e_plant1/models/cartItem.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';

class CartApi {
  final box = GetStorage();
  late String? tokenKey;
  
  
  
  Future<int> makeOrder() async {
    // String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
   // String tokenKey = box.read('token');
    String tokenKey = '5|FO0Z3LIKYeq0n0R5Z8YPrnQ1lxNrz3sQ8oFRbMFl';
    Uri url = Uri.parse(urlbase +'client/makeOrder');
   // Uri url = Uri.parse(urlbase + '/vendor/product/${id}');
    final response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    });

    if (response.statusCode == 201) {
      
      return 1;
    }
    return 0;
  }

  Future<int> removeProductIncart(int? id) async {
    // String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
   // String tokenKey = box.read('token');
    String tokenKey = '5|FO0Z3LIKYeq0n0R5Z8YPrnQ1lxNrz3sQ8oFRbMFl';
    Uri url = Uri.parse(urlbase +'client/removeProductToCart/${id}');
   // Uri url = Uri.parse(urlbase + '/vendor/product/${id}');
    final response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    });

    if (response.statusCode == 200) {
      
      return 1;
    }
    return 0;
  }

  Future<Cart?> getCarts() async {
    // String tokenKey = box.read('token');

    String tokenKey = '5|FO0Z3LIKYeq0n0R5Z8YPrnQ1lxNrz3sQ8oFRbMFl';
    Uri url = Uri.parse(urlbase +'client/carts');
    print(urlbase +'client/carts');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    });
    Cart? fin;
    List<cartItem> cartItemList = [];
    print(response.body);
    if (response.statusCode == 201) {
      var cart = jsonDecode(response.body);

      for (var item in cart['cart_items']) {
        cartItemList.add(cartItem.fromJson(item));
      }
      fin = Cart(cartItemList, cart['total'].toDouble());
    }
   
    return fin;
  }

  Future<List<Product>?> searchProducts(String tag) async {
    //  String tokenKey = box.read('token');
    Map<String, dynamic> body = {
      'search': tag,
    };
    print('hhhhhhhhhhhhhhhhh  : ${tag}');
    //String tokenKey = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    Uri url = Uri.parse(urlbase + '/search');
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $tokenKey',
        },
        body: body);

    List<Product> productsList = [];

    print(response.statusCode);
    if (response.statusCode == 200) {
      var products = jsonDecode(response.body);
      print(products['data']);
      for (var item in products['data']) {
        productsList.add(Product.fromJson(item));
      }
    }
    print(productsList);
    return productsList;
  }

  Future<Product?> getProduct(int id) async {
    // String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    String tokenKey = box.read('token');

    Uri url = Uri.parse(urlbase + '/vendor/product/${id}');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    });

    if (response.statusCode == 200) {
      var product = jsonDecode(response.body);

      var data = Product.fromJson(product['data']);

      return data;
    }
    return null;
  }

  Future<bool?> deleteProduct(int id) async {
    //  String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    String tokenKey = box.read('token');

    Uri url = Uri.parse(urlbase + '/vendor/product/${id}');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<int>? addProduct(int? id) async {
    // String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    // String tokenKey = box.read('token');
   String tokenKey = '5|FO0Z3LIKYeq0n0R5Z8YPrnQ1lxNrz3sQ8oFRbMFl';
    Uri url = Uri.parse(urlbase +'client/addProductToCart');
    Map<String, String> authHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    };

    Map<String, dynamic> body = {
      'product_id': id!.toString(),
   
    };

    // Uri url = Uri.parse(urlbase + '/vendor/product');

    var response = await http.post(url, headers: authHeaders, body: body);

    // print(response.statusCode);

    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  Future<bool>? updateProduct(Product product, int id) async {
    // String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    String tokenKey = box.read('token');

    Map<String, String> authHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    };

    Map<String, dynamic> body = {
      'title': product.title,
      'description': product.description,
      'regular_price': product.regular_price,
      'sale_price': product.sale_price,
      'qty': product.qty,
      'type': product.type,
      'discount': product.discount,
      'category_id': 1.toString(),
    };
    print(body);

    Uri url = Uri.parse(urlbase + '/vendor/product/${id}');
    var response = await http.post(url, headers: authHeaders, body: body);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
