

import 'package:flutter/material.dart';

import 'package:untitled15/Account.dart';

import 'package:untitled15/Category.dart';
import 'package:untitled15/Home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex=0;
  List<Widget> Screens=[
    home(),

    Category(),
    Account(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frist App'),

      ),
      drawer: Drawer(
          child:Center(
            child: Text('Menu'),
          )
      ),
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },

        items:
        [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'My Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Category'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'My Account'
          ),
        ],

      ),
    );
  }
}