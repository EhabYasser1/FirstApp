
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled15/Model/Home_Model.dart';

class HomeProvider with ChangeNotifier{
  HomeModel? home;
  String? token;
  Future<dynamic>getAllData()async{
    var dio=Dio();
    dio.options.headers={
      "lang":"en",
      "Content-Type":"application/json",
      "Authorization":token,

    };


    final response= await dio.get("https://student.valuxapps.com/api/home");
    // print("res "+response.data['data']["products"].toString());

    home=HomeModel.fromJson(response.data);
    notifyListeners();
  }
}

