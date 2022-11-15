import 'dart:convert';


import 'package:e_plant1/models/Compaign.dart';
import 'package:e_plant1/services/api/urlConst.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;



class CompaignApi {

  Future<List<Compaign>?> getCompaign() async {
 String urlcompaign = urlbase +'compaigns';
    // Uri url = Uri.parse(urlbase +'compaigns');
        Uri url = Uri.parse(urlcompaign);
    print(urlbase +'compaigns');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    List<Compaign> compaignlist= [];
    print(response.statusCode);
     print(response.body);
    if (response.statusCode == 200) {
      var compaigns = jsonDecode(response.body);

      for (var item in compaigns['data']) {
        compaignlist.add(Compaign.fromJson(item));
      }
    }
print(compaignlist);
    return compaignlist;
  }


}
