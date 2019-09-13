import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/Widget/LoadPageImageDemo.dart';
import 'package:luggagemanagementsystem/Widget/SkipButton.dart';

class LoadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoadState();
  }
}

class LoadState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //加载页面
          LoadPageImageDemo(),
        ],
      ),
      //跳过按钮
      floatingActionButton: SkipButton(),
    );
  }
}
