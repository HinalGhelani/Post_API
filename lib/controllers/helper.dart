import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modals/Cart_modals.dart';

class APIHelper {
  // APIHelper._();
  //
  // static final APIHelper apiHelper = APIHelper._();

  Future<User> fetchData(Map<String, dynamic> params) async {
    var api = Uri.parse(
        "https://pharmafast.cscodetech.cloud//user_api/u_login_user.php");

    var res = await http.post(
      api,
      body: jsonEncode(params),
    );

    print("Response status : ${res.statusCode}");
    print("Response body : ${res.body}");

    final data = jsonDecode(res.body);

    return User(
        ResponseCode: data['ResponseCode'],
        ResponseMsg: data['ResponseMsg'],
        currency: data['\$'],
        Result: data['true']);
  }
}

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:practice/modals/Cart_modals.dart';
//
// class APIHelper{
//   APIHelper._();
//
//   static final APIHelper apiHelper = APIHelper._();
//
//   Future<Jokes?> fetchData() async{
//     String api = "https://official-joke-api.appspot.com/jokes/random";
//
//     http.Response res  = await http.get(Uri.parse(api));
//
//     if(res.statusCode==200)
//       {
//         Map decodedData = jsonDecode(res.body);
//
//         Jokes jokes = Jokes(data: decodedData);
//
//         return jokes;
//       }
//     return null;
//
//   }
// }

// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class APIHelper {
//   APIHelper._();
//
//   static final APIHelper apiHelper = APIHelper._();
//
//   Future<List?> fetchData() async {
//     String api = "https://dummyjson.com/products?limit=10";
//
//     http.Response res = await http.get(Uri.parse(api));
//
//     if (res.statusCode == 200) {
//       Map data = jsonDecode(res.body);
//
//       List allData = data['products'];
//
//       return allData;
//     }
//     return null;
//   }
// }
