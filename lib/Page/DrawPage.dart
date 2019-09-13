import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/Widget/DrawForm.dart';

class DrawPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawState();
  }
}

class DrawState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: DrawForm(),
    );
  }
}
