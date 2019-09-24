import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_icons/font_awesome.dart';
import 'package:intl/intl.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_format/date_format.dart';

class DepositForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DepositFormState();
  }
}

class DepositFormState extends State<DepositForm> {
  final _depositFormKey = GlobalKey<FormState>();

  //客户姓名
  String _saverName;

  //客户手机号
  String _phoneNumber;

  //性别
  int _gender = 1;

  //接待行李员姓名
  String _recieveName;

  //行李员所属酒店
  String _hotel;

  //行李描述
  String _luggageDescribe;

  //行李寄存的时间
  String _saveTime;

  //行李预计存放的时间
  String _saveForeTime =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

  //行李件数
  int _number;

  //下拉按钮返回组件构造方法
  List<DropdownMenuItem> getListData() {
    List<DropdownMenuItem> items = new List<DropdownMenuItem>.generate(
        10,
        (i) => new DropdownMenuItem(
              child: Text(
                '${i + 1}${MyLocalizations.of(context).pieceText}',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setWidth(35.0)),
              ),
              value: i + 1,
            ));
    return items;
  }

  //日期选择器返回时间
  _selectDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(new Duration(days: 1)),
        lastDate: DateTime(2100));

    if (date == null) {
      return;
    } else {
      setState(() {
        //_saveForeTime = DateFormat.yMd().format(date);
        _saveForeTime = '${date.year}-${date.month}-${date.day}';
      });
    }
  }

  //获取行李员的信息
  getMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _recieveName = sharedPreferences.getString('username');
      _hotel = sharedPreferences.getString('hotel');
      _saveTime = DateTime.now().toString();
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
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Form(
        key: _depositFormKey,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil.getInstance().setWidth(45.0),
                      ScreenUtil.getInstance().setHeight(60.0),
                      ScreenUtil.getInstance().setWidth(20.0),
                      0),
                  height: ScreenUtil.getInstance().setHeight(1291.0),
                  width: ScreenUtil.getInstance().setWidth(990.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular((5.0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil.getInstance().setWidth(20.0),
                      ScreenUtil.getInstance().setHeight(40.0),
                      0,
                      0),
                  height: ScreenUtil.getInstance().setHeight(1300.0),
                  width: ScreenUtil.getInstance().setWidth(1000.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular((5.0)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(7.0, 7.0),
                            color: Colors.grey,
                            blurRadius: 1.0,
                            spreadRadius: -3.0)
                      ]),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                        ScreenUtil.getInstance().setWidth(50.0),
                        ScreenUtil.getInstance().setHeight(20.0),
                        ScreenUtil.getInstance().setWidth(50.0),
                        0),
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.format_list_bulleted,
                            size: ScreenUtil.getInstance().setHeight(80.0),
                          ),
                          Text(
                            '${MyLocalizations.of(context).depositOrderText}',
                            style: TextStyle(
                                fontSize:
                                    ScreenUtil.getInstance().setHeight(80.0)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(10.0),
                            top: ScreenUtil.getInstance().setHeight(10.0)),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(280.0),
                            height: ScreenUtil.getInstance().setHeight(5.0),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(100.0),
                      ),
                      Table(
                        columnWidths: {
                          0: FixedColumnWidth(
                              ScreenUtil.getInstance().setWidth(80.0)),
                          1: FixedColumnWidth(
                              ScreenUtil.getInstance().setWidth(600.0))
                        },
                        children: [
                          TableRow(children: [
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${MyLocalizations.of(context).nameText}：',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setWidth(35.0),
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${MyLocalizations.of(context).pleaseEnterNameText}',
                                ),
                                onSaved: (String value) {
                                  setState(() {
                                    _saverName = value;
                                  });
                                },
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top:
                                      ScreenUtil.getInstance().setHeight(25.0)),
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${MyLocalizations.of(context).genderText}：',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setWidth(35.0),
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      ScreenUtil.getInstance().setWidth(20.0),
                                ),
                                Icon(
                                  FontAwesome.getIconData('male'),
                                  color: Colors.blue,
                                  size: ScreenUtil.getInstance().setWidth(60.0),
                                ),
                                Text(
                                  '${MyLocalizations.of(context).maleText}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.blue),
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: this._gender,
                                  onChanged: (v) {
                                    setState(() {
                                      this._gender = v;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width:
                                      ScreenUtil.getInstance().setWidth(50.0),
                                ),
                                Icon(
                                  FontAwesome.getIconData('female'),
                                  color: Colors.pinkAccent,
                                  size: ScreenUtil.getInstance().setWidth(60.0),
                                ),
                                Text(
                                  '${MyLocalizations.of(context).femaleText}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.pinkAccent),
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: this._gender,
                                  onChanged: (v) {
                                    setState(() {
                                      this._gender = v;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${MyLocalizations.of(context).phoneText}：',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setWidth(35.0),
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${MyLocalizations.of(context).pleaseEnterPhoneText}',
                                ),
                                keyboardType: TextInputType.phone,
                                onSaved: (String value) {
                                  setState(() {
                                    _phoneNumber = value;
                                  });
                                },
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${MyLocalizations.of(context).storeToText}：',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setWidth(35.0),
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top:
                                      ScreenUtil.getInstance().setHeight(15.0)),
                              child: InkWell(
                                onTap: _selectDate,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      _saveForeTime,
                                      style: TextStyle(
                                          fontSize: ScreenUtil.getInstance()
                                              .setHeight(32.0)),
                                    ),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${MyLocalizations.of(context).piecesText}：',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setWidth(35.0),
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().setHeight(15.0),
                                  right:
                                      ScreenUtil.getInstance().setWidth(30.0),
                                  left:
                                      ScreenUtil.getInstance().setWidth(20.0)),
                              child: DropdownButton(
                                items: getListData(),
                                hint: Text(
                                  '${MyLocalizations.of(context).pleaseEnterPiecesText}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0)),
                                ),
                                value: _number,
                                onChanged: (value) {
                                  setState(() {
                                    _number = value;
                                  });
                                },
                                isDense: true,
                                isExpanded: true,
                                underline: Container(),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20.0),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              height: ScreenUtil.getInstance().setHeight(80.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${MyLocalizations.of(context).describeText}：',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setWidth(35.0),
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: ScreenUtil.getInstance().setHeight(450.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '${MyLocalizations.of(context).pleaseEnterDescribeText}',
                                  alignLabelWithHint: true,
                                ),
                                maxLines: 8,
                                maxLength: 140,
                                onSaved: (String value) {
                                  setState(() {
                                    _luggageDescribe = value;
                                  });
                                },
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setWidth(150.0),
                  right: ScreenUtil.getInstance().setWidth(150.0),
                  top: ScreenUtil.getInstance().setHeight(70.0)),
              child: RaisedButton(
                color: Colors.teal,
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(100.0),
                  alignment: Alignment.center,
                  child: Text(
                    "${MyLocalizations.of(context).depositText}",
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil.getInstance().setHeight(50.0),
                    ),
                  ),
                ),
                onPressed: () {
                  _depositFormKey.currentState.save();
                  print(
                      '客户姓名；${_saverName},性别：${_gender},手机号:${_phoneNumber},行李员姓名：${_recieveName},行李员所属酒店：${_hotel},行李描述：${_luggageDescribe}, 当前时间：${_saveTime}, 预计领取时间: ${_saveForeTime}, 件数：${_number}');
                  deposit();
                  _depositFormKey.currentState.reset();
                },
              ),
            ),
          ],
        ));
  }

  //发送寄存表单
  deposit() async {
    String _sex;
    if (_gender == 1) {
      _sex = '男';
    } else if (_gender == 2) {
      _sex = '女';
    }

    String succeedJson = '{"status":200,"msg":"OK","data":"D180","ok":true}';
    String faliureJson = '{"status":500,"msg":"电话号码错误","data":null,"ok":false}';

//    Response response;
//    FormData formData = FormData.from({
//      'savername': _saverName,
//      'gender': _sex,
//      'phonenumber': _phoneNumber,
//      'recievername': _recieveName,
//      'hotel': _hotel,
//      'luggagedescribe': _luggageDescribe,
//      'savetime': _saveTime,
//      'saveforetime': _saveForeTime,
//      'number': _number,
//    });
//    response = await Dio()
//        .post('http://192.168.31.71:8080/luggage/neworder', data: formData);
//    print('response = ${response}');
    //Map<String, dynamic> data = json.decode(response.toString());
    Map<String, dynamic> data = json.decode(succeedJson);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (data['status'] == 200) {
            return AlertDialog(
              title: Text('寄存成功'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//                  Text(
//                    data['msg'].toString(),
//                  ),
                  Text(
                    '领取二维码:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil.getInstance().setHeight(60.0),
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(600.0),
                    height: ScreenUtil.getInstance().setHeight(520.0),
                    alignment: Alignment.center,
                    child: QrImage(
                      data: '${data['data'].toString()}',
                      size: 300.0,
                      embeddedImage: AssetImage('images/pic.png'),
                      embeddedImageStyle:
                          QrEmbeddedImageStyle(size: Size(40, 40)),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    _depositFormKey.currentState.reset();
                    Navigator.of(context).pop();
                  },
                  child: Text('${MyLocalizations.of(context).defineText}'),
                )
              ],
            );
          } else if (data['status'] == 500) {
            return AlertDialog(
              title: Text('寄存失败'),
              content: Text('${data['msg']}'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      _depositFormKey.currentState.reset();
                      Navigator.of(context).pop();
                    },
                    child: Text('${MyLocalizations.of(context).defineText}'))
              ],
            );
          }
        });
  }
}
