import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class Deatailescontoller extends GetxController{
  var isLoading=true.obs;
  var productDeatiles={}.obs;


  Future<void>fetchProductDetails(int id) async{
    final url= Uri.parse("https://fakestoreapi.com/products/$id");
    try{
      final response= await http.get(url);
      if(response.statusCode==200){
        productDeatiles.value= json.decode(response.body);
      }else{
        throw Exception("Failed tol load");
      }
    }catch(error){
      print("Error$error");
    }finally{
      isLoading.value=false;
    }
  }
}