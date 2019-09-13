import 'package:flutter/material.dart';

class LoadPageImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image(
      //设置加载页图片
      image: AssetImage('images/loading.png'),
      //设置图片组件高度宽度充满屏幕
      height: double.infinity,
      width: double.infinity,
      //设置图片大小覆盖整个组件
      fit: BoxFit.cover,
    );
  }
}
