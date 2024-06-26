
import 'package:coinone_gallery/network/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  static Future<http.Response?> featchProductes() async {
    try {
      final http.Response responce = await http.get(Uri.parse(
          Urls.productsUrl));
  
      return responce;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

   static Future<http.Response?> featchProductDetails({required String id}) async {
    try {
      final http.Response responce = await http.get(Uri.parse("${Urls.productDetailsUrl}$id"));

      return responce;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }


}



