import 'dart:convert';


import 'package:e_plant1/models/Compaign.dart';
import 'package:e_plant1/models/shop.dart';
import 'package:e_plant1/services/api/urlConst.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;



class ShopApi {

  Future<List<Shop>?> getCompaign() async {
 String urlshop = urlbase + 'shops';
    // Uri url = Uri.parse(urlbase +'compaigns');  
        Uri url = Uri.parse(urlshop);
    print(urlbase +'shops');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    });

    List<Shop> shopslist= [];
    print(response.statusCode);
     print(response.body);
    if (response.statusCode == 200) {
      var shops= jsonDecode(response.body);

      for (var item in shops['data']) {
        shopslist.add(Shop.fromJson(item));
      }
    }
print(shopslist);
    return shopslist;
  }


}
