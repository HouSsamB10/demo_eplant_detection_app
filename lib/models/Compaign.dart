import 'dart:convert';
import 'dart:ffi';

class Compaign {
  late int? id;
  late int? shop_id;
  late String? image_url;
  late String? starts_on;
  late String? ends_on;


  Compaign({
    required this.id,
    required this.shop_id,
    required this.image_url,
    required this.starts_on,
    required this.ends_on,
  });

  factory Compaign.fromJson(Map<String, dynamic> data) {
 

    return Compaign(
      id: data['id'],
      shop_id: data['shop_id'],
      image_url: data['image_url'].toString(),
      starts_on: data['starts_on'].toString(),
      ends_on: data['ends_on'].toString(),
    
    );
  }
}


