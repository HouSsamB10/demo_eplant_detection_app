import 'dart:convert';


import 'package:e_plant1/view/const.dart';

class Shop{
  late int? id;
  late String? shop_name;
  late String? about;
  late String? url_cover;
  late String? url_logo;
  late int? items_sold;
  late String? created_at;
  late String? updated_at;
  late int? user_id;





  Shop({
    required this.id,
    required this.shop_name,
    required this.about,
    required this.url_cover,
    required this.url_logo,
    required this.items_sold,
    required this.created_at,
    required this.updated_at,
    required this.user_id,
 
  });

  factory Shop.fromJson(Map<String, dynamic> data) {
 
    return Shop(
      id: data['id'],
      shop_name: data['shop_name'].toString(),
      about: data['about'].toString(),
      url_cover: data['url_cover'].toString(),
      url_logo: data['url_logo'].toString(),
      items_sold: data['items_sold'],
      created_at: data['created_at'].toString(),
      updated_at: data['updated_at'].toString(),
      user_id: data['user_id'],
    );
  }
}

