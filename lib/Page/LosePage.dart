import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LosePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LosePageState();
  }
}

class LosePageState extends State<LosePage> {
  String _searchPhone;
  bool _isHide = true;

  String _status = '';
  String _msg = '';

  String _succeedJson = '{"status":200,"msg":"OK","data":null,"ok":true}';
  String _failureJson =
      '{"status":555,"msg":"没有此号码的存行李记录","data":null,"ok":false}';

  getMessage() async {
    Map<String, dynamic> data = json.decode(_succeedJson);
    setState(() {
      _status = data['status'].toString();
      _msg = data['msg'].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1980)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('查找订单'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                height: ScreenUtil.getInstance().setHeight(200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil.getInstance().setWidth(700.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '根据手机号查询',
                          prefixIcon: Icon(Icons.phone_iphone),
                        ),
                        onSaved: (String value) {
                          setState(() {
                            _searchPhone = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(300.0),
                      height: ScreenUtil.getInstance().setHeight(130.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            _isHide = !_isHide;
                          });
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  ScreenUtil.getInstance().setHeight(50.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Offstage(
              offstage: _isHide,
              child: Container(
                height: ScreenUtil.getInstance().setHeight(1480.0),
                child: ListView(
                  children: <Widget>[
                    Text('status : ${_status}'),
                    Text('msg : ${_msg}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
