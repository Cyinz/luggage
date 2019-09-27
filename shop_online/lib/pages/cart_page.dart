import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartState();
  }
}

class CartState extends State<CartPage>{
  @override
  Widget build(BuildContext context) {

    print('cart');

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}