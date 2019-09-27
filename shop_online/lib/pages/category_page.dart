import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryState();
  }
}

class CategoryState extends State<CategoryPage>{
  @override
  Widget build(BuildContext context) {

    print('category');

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}