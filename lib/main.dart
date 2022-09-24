import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled15/HomeScreen.dart';
import 'package:untitled15/Login.dart';
import 'package:untitled15/Provider/Home_Provider.dart';
import 'package:untitled15/Provider/Register_Provider.dart';

import 'Provider/Category_Provider.dart';
// import 'package:untitled15/Register.dart';

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => RegisterProvider()),

        ],
        child: MaterialApp(
        home: login(),
        )
    );

  }
}
