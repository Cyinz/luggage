import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/Widget/DepositForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepositPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DepositState();
  }
}

class DepositState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1980)..init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(child: DepositForm()),
    );
  }
}
