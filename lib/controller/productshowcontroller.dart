import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Productlistcontroller extends GetxController{

  var productlist=[].obs;
  var isLoading=true.obs;

  @override
  void onInit() {

    super.onInit();
    featchproduct();

  }

  Future<void> featchproduct()async{
    final url= Uri.parse("https://fakestoreapi.com/products?limit=50");
    try{
      final response= await http.get(url);
      if(response.statusCode==200){
        final data=json.decode(response.body);
        productlist.assignAll(data);
      }else{
        throw Exception("Failed");
      }
    }catch(error){
      print("Error :$error");
    }finally{
      isLoading.value=false;
    }
  }

}

