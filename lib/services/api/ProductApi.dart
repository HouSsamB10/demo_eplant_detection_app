import 'dart:convert';
import 'dart:io';

import 'package:e_plant1/services/api/urlConst.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';

class ProductApi {
  List<Product> listproduct = [];

  final box = GetStorage();
  late String? tokenKey;
/*
  Future<List<Product>?> getProducts() async {
   // String tokenKey = box.read('token');
 String tokenKey = '5|FO0Z3LIKYeq0n0R5Z8YPrnQ1lxNrz3sQ8oFRbMFl';
    //String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    Uri url = Uri.parse(urlbase +'vendor/products');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokenKey',
    });

    List<Product> productsList = [];
    print(response.statusCode);
     print(response.body);
    if (response.statusCode == 200) {
      var products = jsonDecode(response.body);

      for (var item in products['data']) {
        productsList.add(Product.fromJson(item));
      }
    }

    return productsList;
  }
*/
  Future<List<Product>?> searchProducts(String tag) async {
    //  String tokenKey = box.read('token');
    Map<String, dynamic> body = {
      'search': tag,
    };
    print('hhhhhhhhhhhhhhhhh  : ${tag}');
    //String tokenKey = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
  
    Uri url = Uri.parse(urlbase +'search');
    print(urlbase +'search'); 
  //  Uri url = Uri.parse(urlbase + '/search');
    final response = await http.post(url,
        headers: {
        //  'Content-Type': 'application/json',
      'Accept': 'application/json',
          // 'Authorization': 'Bearer $tokenKey',
        },
        body: body);

    List<Product> productsList = [];
    print(response.statusCode);
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

    Future< List<Product>?> getProducts(int id) async {
    // String token = '6|kjMc4s64ub33jAN9GFVq08G2JyZGO4JlkROI0XCo';
    // String tokenKey = box.read('token');

    Uri url = Uri.parse(urlbase + 'productsbyshop/${id.toString()}');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $tokenKey',
    });
  List<Product>? listproduct = [] ;
  print(response.body);
    if (response.statusCode == 200) {
      var products= jsonDecode(response.body);

      for (var item in products['data']) {
        listproduct.add(Product.fromJson(item));
      }
    }
    print(listproduct);
    return listproduct;
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

  Future<bool>? addProduct(Product product) async {
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
      //  'image': file,
    };

    Uri url = Uri.parse(urlbase + '/vendor/product');

    var response = await http.post(url, headers: authHeaders, body: body);

    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
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
