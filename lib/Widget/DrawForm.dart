import 'dart:convert';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DrawForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawFormState();
  }
}

class DrawFormState extends State<DrawForm> {
  final _drawForm = GlobalKey<FormState>();

  //行李领取码
  String _getcode = '';

  //状态码
  int state;

  //扫码得到的信息
  String _barcode = '扫码得到的信息';

  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    // TODO: implement build
    return Form(
      key: _drawForm,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(800.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${MyLocalizations.of(context).getcodeText}',
                  prefixIcon: Icon(Icons.content_paste),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return '${MyLocalizations.of(context).getcodeText}';
                  }
                },
                onSaved: (String value) {
                  setState(() {
                    _getcode = value;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(20.0)),
                padding: EdgeInsets.only(
                    right: ScreenUtil.getInstance().setWidth(80.0)),
                height: ScreenUtil.getInstance().setHeight(60.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/lose');
                  },
                  child: Text(
                    '${MyLocalizations.of(context).getcodeLossText}？',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: ScreenUtil.getInstance().setHeight(40.0),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(20.0)),
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  //输入有内容后
                  if (_drawForm.currentState.validate()) {
                    _drawForm.currentState.save();
                    query(_getcode, 0);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil.getInstance().setHeight(80.0),
                  width: ScreenUtil.getInstance().setWidth(400.0),
                  child: Text(
                    '${MyLocalizations.of(context).drawText}',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setHeight(40.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            //Text(_barcode),
            RaisedButton(
              color: Colors.teal,
              onPressed: () {
                scan();
              },
              child: Container(
                alignment: Alignment.center,
                height: ScreenUtil.getInstance().setHeight(80.0),
                width: ScreenUtil.getInstance().setWidth(400.0),
                child: Text(
                  '${MyLocalizations.of(context).scanText}',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setHeight(40.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print('扫码结果：' + barcode);
      setState(() {
        _barcode = barcode;
        query(barcode, 0);
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('未授予APP相机权限');
      } else {
        print('扫码错误：$e');
      }
    } on FormatException {
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      print('扫码错误：$e');
    }
  }

  //只查不取
  query(String getcode, int state) async {
    print('getcode = ${getcode}, state = ${state}');
    //行李状态
    String status;
    //客户姓名
    String savername;
    //客户手机号
    String phonenumber;
    //行李员姓名
    String receivername;
    //行李员酒店
    String hotel;
    //行李描述
    String describe;
    //寄存时间
    String savetime;
    //预计领取时间
    String saveforetime;

    Response response;
    FormData formData = FormData.from({
      'getcode': getcode,
      'state': state,
    });
    response = await Dio()
        .post('http://192.168.31.71:8080/luggage/getluggage', data: formData);

    //未领取返回的Json
    String successJson =
        '{"status":200,"msg":"get","data":{"savername":"陈尹哲","phonenumber":"13336550309","receivername":"金泽龙","hotel":"国际交流中心","describe":"1件无损坏","savetime":"2019-7-29","saveforetime":"2019-8-1","gettime":"gettime","sendstate":1,"getcode":"D180","istoken":0},"ok":true}';
    //已领取返回的Json
    String failureJson =
        '{"status":250,"msg":"getted","data":{"savername":"陈尹哲","phonenumber":"13336550309","receivername":"金泽龙","hotel":"国际交流中心","describe":"1件无损坏","savetime":"2019-7-29","saveforetime":"2019-8-1","gettime":"gettime","sendstate":1,"getcode":"D180","istoken":1},"ok":false}';

    Map<String, dynamic> data = json.decode(response.toString());
    //Map<String, dynamic> data = json.decode(successJson);
    print(data);

    //查询后弹出检查信息表
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (data['status'] == 200) {
            Map<String, dynamic> drawdata = data['data'];
            return AlertDialog(
              title: Text('未领取'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('客户姓名：${drawdata['savername']}'),
                  Text('预留电话：${drawdata['phonenumber']}'),
                  Text('行李员姓名：${drawdata['receivername']}'),
                  Text('行李员酒店：${drawdata['hotel']}'),
                  Text('行李描述：${drawdata['describe']}'),
                  Text('寄存时间：${drawdata['savetime']}'),
                  Text('预计领取时间：${drawdata['saveforetime']}'),
                ],
              ),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    draw(getcode, 1);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '确定领取',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          } else if (data['status'] == 250) {
            Map<String, dynamic> drawdata = data['data'];
            return AlertDialog(
              title: Text('已领取'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('客户姓名：${drawdata['savername']}'),
                  Text('预留电话：${drawdata['phonenumber']}'),
                  Text('行李员姓名：${drawdata['receivername']}'),
                  Text('行李员酒店：${drawdata['hotel']}'),
                  Text('行李描述：${drawdata['describe']}'),
                  Text('寄存时间：${drawdata['savetime']}'),
                  Text('预计领取时间：${drawdata['saveforetime']}'),
                ],
              ),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          }
          else if(data['status'] == 500){
            return AlertDialog(
              title: Text('查询结果'),
              content: Text('${data['msg']}'),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          }
        });
  }

  //查后领取
  draw(String getcode, int state) async {
    Response response;
    FormData formData = FormData.from({
      'getcode': getcode,
      'state': state,
    });
    response = await Dio()
        .post('http://192.168.31.71:8080/luggage/getluggage', data: formData);

    print(response);
  }
}
