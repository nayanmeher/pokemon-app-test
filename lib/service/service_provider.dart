import 'dart:developer';
import 'dart:io';


import 'package:http/http.dart' as http;


class ServiceProvider{
  Future<dynamic> get(String url) async {
    try {
      final resp = await http.get(Uri.parse(url));
      if(resp.statusCode == 200){
        return resp.body;
      }else{
        throw Exception('Something went wrong , status code: ${resp.statusCode}');
      }
    }catch (e, st){
      log('Exception : get : $e , $st');
    }

  }
}