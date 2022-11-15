import 'dart:convert';
import 'dart:io';


import 'package:e_plant1/models/user.dart';
import 'package:e_plant1/services/api/urlConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  late String token;
  final storage = new FlutterSecureStorage();

  Future<User>? login(List<String> user) async {
    Map<String, String> authHeaders = {
      'Accept': 'application/json',
      //  'Authorization': 'Bearer $token',
    };
    print('email: ${user[0]}  password: ${user[1]}');
    Map<String, dynamic> body = {
      'email': user[0],
      'password': user[1],
    };
    Uri url = Uri.parse(urlbase + 'login');
    print(urlbase + '/login');
    var response = await http.post(url, headers: authHeaders, body: body);

    User? getuser;
    print(response.body);
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      getuser = User.fromJson(data['user']);

      token = data['token'];

      await storage.write(key: 'token', value: token);
      String? valueToken = await storage.read(key: 'token');
      print(valueToken);
    }

    return getuser!;
  }


  Future<User>? registerClient(User user , File? image) async {
    //String token = box.read('token');

    Map<String, String> authHeaders = {
      'Accept': 'application/json',
      //'Authorization': 'Bearer $token',
    };

    Map<String, String> body = {
      'firstname': user.firstname.toString(),
      'lastname': user.lastname.toString(),
      'phone_number': user.phone_number.toString(),
      'email': user.email.toString(),
      'password': user.password.toString(),
      // 'adress_id': user.adress_id.toString(),
      //  'avatar_url': ,
    };


    
    print(body);
    Uri url = Uri.parse(urlbase + 'register');


    var length = await image!.length();
    http.MultipartRequest request = new http.MultipartRequest('POST', url)
      ..headers.addAll(authHeaders)
      ..fields.addAll(body)
      ..files.add(
        // replace file with your field name exampe: image
        http.MultipartFile('avatar_url', image.openRead(), length,
            filename: 'test.png'),
      );

    var respons = await http.Response.fromStream(await request.send());
    print(respons.statusCode);
 
 User? getuser;

    if (respons.statusCode == 201) {
    var data = jsonDecode(respons.body);
      getuser = User.fromJson(data['user']);

      token = data['token'];

      await storage.write(key: 'token', value: token);
      String? valueToken = await storage.read(key: 'token');
      print(valueToken.toString() + 'hhhhhhhhhhhhhhhhhhh');
      return getuser;
    }else{
 return getuser!;
    } 

       
  }

  Future<bool>? logout() async {
    //  String tokenKey = box.read('token');
    // String tokenKey =
    //     '2|qMok38X2FE1ouZfRTSfzgpY0os2ig2fP6Vlc6biw'; // box.read('token');
    String? tokenKey = await storage.read(key: 'token');
    Map<String, String> authHeaders = {
      'Accept': 'application/json',
       'Authorization': 'Bearer $tokenKey',
    };

    Uri url = Uri.parse(urlbase + 'client/logout');
    var response = await http.post(url, headers: authHeaders);
    // not done

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print(data['message']);
      await storage.delete(key: 'token');

      return true;
    }
    return false;
  }
}
