import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MemberState();
  }
}

class MemberState extends State<MemberPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print('member');

    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}