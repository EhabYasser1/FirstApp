import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled15/Model/Category_Model.dart';

class CategoryProvider with ChangeNotifier{
  CategoryModel? category;
  String? token;
  Future<dynamic>getAllCategory()async{
    var dio =Dio();
    dio.options.headers={
      "lang":"en",
      "Authorization":token,
    };
    final response=await dio.get("https://student.valuxapps.com/api/categories");
    category=CategoryModel.fromJson(response.data );


  }
}