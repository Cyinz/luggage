import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';

//订单列表信息
List responseJson;

int _rowCount = 0;

BuildContext _context;

String msg;

//日期选择器返回时间
_selectDate() async {
  DateTime date = await showDatePicker(
      context: _context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(new Duration(days: 1)),
      lastDate: DateTime(2100));

  if (date == null) {
    return;
  } else {}
}

class PostDataSource extends DataTableSource {
  final List _posts = responseJson;
  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => _rowCount;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(_posts[index]['savername'].toString()),
        ),
        DataCell(
          Text(_posts[index]['saverphonenumber'].toString()),
        ),
        DataCell(
          _posts[index]['luggageistoken'] == 0 ? Text('未领取') : Text('已领取'),
//        Text(_posts[index]['luggageistoken'].toString()),
        ),
        DataCell(
          RaisedButton(
            color: Colors.teal,
            onPressed: () {
              print('onPressed');
              showDialog(
                  context: _context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('修改订单'),
                      content: Form(
                        child: Table(
                          columnWidths: {
                            0: FixedColumnWidth(
                              ScreenUtil.getInstance().setWidth(80.0),
                            ),
                            1: FixedColumnWidth(
                              ScreenUtil.getInstance().setWidth(300.0),
                            ),
                          },
                          children: [
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '姓名：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: TextFormField(
                                  initialValue:
                                      '${_posts[index]['savername'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {},
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '手机号：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: TextFormField(
                                  initialValue:
                                      '${_posts[index]['saverphonenumber'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {},
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '件数：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: TextFormField(
                                  initialValue:
                                      '${_posts[index]['luggagedecribe'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {},
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '描述：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: TextFormField(
                                  initialValue:
                                      '${_posts[index]['luggagedecribe'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {},
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '寄存时间：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              //luggagesavetime
                              Container(
                                alignment: Alignment.centerLeft,
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Text(
                                    '${_posts[index]['luggagesavetime'].toString()}'),
                              ),
                            ]),
                            TableRow(children: [
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '存放至：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil.getInstance()
                                        .setHeight(15.0)),
                                child: InkWell(
                                  onTap: _selectDate,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '${_posts[index]['luggagesaveforetime'].toString()}',
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
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                              SizedBox(
                                height:
                                    ScreenUtil.getInstance().setHeight(20.0),
                              ),
                            ]),
                            TableRow(children: [
                              Container(
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '取行李码：',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.getInstance()
                                          .setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height:
                                    ScreenUtil.getInstance().setHeight(80.0),
                                child: Text(
                                    '${_posts[index]['luggagegetcode'].toString()}'),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            print('取消');
                            Navigator.of(context).pop();
                          },
                          child:
                              Text('${MyLocalizations.of(context).cancelText}'),
                        ),
                        FlatButton(
                          onPressed: () {
                            print('确认');
                            Navigator.of(context).pop();
                          },
                          child:
                              Text('${MyLocalizations.of(context).defineText}'),
                        ),
                      ],
                    );
                  });
            },
            child: Text(
              '修改订单',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  //排序
  void _sort() {}
}

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

  //行李员姓名
  String _name;

  //排序的索引号
  int _sortColumnIndex;

  //排序用的方法  升序
  bool _sortAscending = true;

  //表格数据源
  PostDataSource _postsDataSource = PostDataSource();

  //查找方式
  int type;

  //下拉选择按何种方式查找
  List<DropdownMenuItem> getListData() {
    List<DropdownMenuItem> items = new List();
    DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
      child: Text('所有'),
      value: 1,
    );
    items.add(dropdownMenuItem1);
    DropdownMenuItem dropdownMenuItem2 = DropdownMenuItem(
      child: Text('按客户姓名查找'),
      value: 2,
    );
    items.add(dropdownMenuItem2);
    DropdownMenuItem dropdownMenuItem3 = DropdownMenuItem(
      child: Text('按客户电话查找'),
      value: 3,
    );
    items.add(dropdownMenuItem3);
    DropdownMenuItem dropdownMenuItem4 = DropdownMenuItem(
      child: Text('按行李员姓名查找'),
      value: 4,
    );
    items.add(dropdownMenuItem4);
    return items;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMessage();

    String resMessage =
        //response.toString();
        '[{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"2c29e792-ca3e-11e9-8d8f-2fb4f7bbc196","savername":"陈尹哲男","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"国际交流中心","luggagedecribe":"3无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"F720","luggageistoken":0},{"orderid":"61b52136-c4b9-11e9-8e5d-3753fbf1c60c","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"国际交流中心","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-7-30","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"7554","luggageistoken":0},{"orderid":"8e173cf0-cccf-11e9-b6d1-07ba93afb57e","savername":"金先生男","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"国际交流中心","luggagedecribe":"3无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"2019-09-05 20:26:54","messagesendstate":1,"luggagegetcode":"i699","luggageistoken":1}]';

    setState(() {
      responseJson = json.decode(resMessage);
      //responseJson = json.decode(response.toString());
      print('responseJson = ${responseJson}');
      _rowCount = responseJson.length;
      print(_rowCount);
      _postsDataSource = PostDataSource();
    });
  }

  //通过行李员姓名获取订单列表
  getOrderlist4(String name) async {
    Response response;
    FormData formData = FormData.from({
      'recievername': name,
    });
    response = await Dio().post(
        'http://192.168.31.71:8080/record/ByReceiverName',
        data: formData,
        options: Options(responseType: ResponseType.plain));
    print(response);

    String resMessage =
        //response.toString();
        '[{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"0ab03b26-c259-11e9-bb85-39c842f1f3ed","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"22","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"s851","luggageistoken":0},{"orderid":"2c29e792-ca3e-11e9-8d8f-2fb4f7bbc196","savername":"陈尹哲男","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"国际交流中心","luggagedecribe":"3无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"F720","luggageistoken":0},{"orderid":"61b52136-c4b9-11e9-8e5d-3753fbf1c60c","savername":"金先生","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"国际交流中心","luggagedecribe":"1件无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-7-30","luggagegettime":"gettime","messagesendstate":1,"luggagegetcode":"7554","luggageistoken":0},{"orderid":"8e173cf0-cccf-11e9-b6d1-07ba93afb57e","savername":"金先生男","saverphonenumber":"13631218312","recievername":"行李员甲","luggagehotel":"国际交流中心","luggagedecribe":"3无损坏","luggagesavetime":"2019-7-29","luggagesaveforetime":"2019-2-1","luggagegettime":"2019-09-05 20:26:54","messagesendstate":1,"luggagegetcode":"i699","luggageistoken":1}]';

    setState(() {
      //responseJson = json.decode(resMessage);
      responseJson = json.decode(response.toString());
      print('responseJson = ${responseJson}');
      _rowCount = responseJson.length;
      print(_rowCount);
      _postsDataSource = PostDataSource();
    });
  }

  //通过客户姓名获取订单列表
  getOrderlist2(String name) async {
    Response response;
    FormData formData = FormData.from({
      'recievername': name,
    });
    response = await Dio().post('http://192.168.31.71:8080/record/BySavername',
        data: formData, options: Options(responseType: ResponseType.plain));
    print(response);

    setState(() {
      //responseJson = json.decode(resMessage);
      responseJson = json.decode(response.toString());
      print('responseJson = ${responseJson}');
      _rowCount = responseJson.length;
      print(_rowCount);
      _postsDataSource = PostDataSource();
    });
  }

  //获取所有订单列表
  getOrderlist1() async {
    Response response;
    response = await Dio().post(
        'http://192.168.31.71:8080/record/selectLuggage',
        options: Options(responseType: ResponseType.plain));
    print(response);

    setState(() {
      responseJson = json.decode(response.toString());
      print('responseJson = ${responseJson}');
      _rowCount = responseJson.length;
      print(_rowCount);
      _postsDataSource = PostDataSource();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _context = context;
    });
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1980)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('凭证丢失'),
      ),
      body: SingleChildScrollView(
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
                          labelText: '重新发送至手机',
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
                            //_isHide = !_isHide;
                          });
                        },
                        child: Text(
                          '发送',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  ScreenUtil.getInstance().setHeight(50.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(100.0),
                  child: Divider(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '查找订单',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setHeight(50.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.getInstance().setWidth(15.0)),
                  height: ScreenUtil.getInstance().setHeight(140.0),
                  width: ScreenUtil.getInstance().setWidth(400.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: '请输入查找信息',
                    ),
                    onSaved: (val) {
                      setState(() {
                        msg = val;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(30.0),
                  ),
                  alignment: Alignment.center,
                  height: ScreenUtil.getInstance().setHeight(140.0),
                  width: ScreenUtil.getInstance().setWidth(400.0),
                  child: DropdownButton(
                    items: getListData(),
                    hint: Text('选择查找方式'),
                    value: type,
                    onChanged: (value) {
                      setState(() {
                        type = value;
                      });
                    },
                    underline: Container(),
                    isExpanded: true,
                    isDense: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(50.0),
                  ),
                  height: ScreenUtil.getInstance().setHeight(140.0),
                  width: ScreenUtil.getInstance().setWidth(250.0),
                  child: RaisedButton(
                    color: Colors.teal,
                    child: Text(
                      '查找',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().setHeight(40.0),
                      ),
                    ),
                    onPressed: () {
                      switch (type) {
                        case 1:
                          print('1');
                          setState(() {
                            _isHide = false;
                            getOrderlist1();
                          });
                          break;
                        case 2:
                          print('2');
                          setState(() {
                            _isHide = false;
                            getOrderlist2(msg);
                          });
                          break;
                        case 3:
                          print('3');
                          setState(() {
                            _isHide = false;
                          });
                          break;
                        case 4:
                          print('4');
                          setState(() {
                            _isHide = false;
                          });
                          break;
                        default:
                          Fluttertoast.showToast(
                            msg: '请选择查找类型',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                          );
                          break;
                      }
                    },
                  ),
                ),
              ],
            ),
            Offstage(
              offstage: _isHide,
              child: PaginatedDataTable(
                header: Text('订单列表'),
                dataRowHeight: ScreenUtil.getInstance().setHeight(120.0),
                columnSpacing: ScreenUtil.getInstance().setWidth(20.0),
                headingRowHeight: ScreenUtil.getInstance().setHeight(70.0),
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                      label: Container(
                        child: Text('客户姓名'),
                      ),
                      onSort: (int columnIndex, bool ascending) {
                        _postsDataSource._sort();

                        setState(() {
                          _sortColumnIndex = columnIndex;
                          _sortAscending = ascending;
                        });
                      }),
                  DataColumn(
                    label: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil.getInstance().setWidth(200.0),
                      child: Text('手机号'),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      child: Text('领取状态'),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: ScreenUtil.getInstance().setWidth(200.0),
                      alignment: Alignment.center,
                      child: Text('修改订单'),
                    ),
                  ),
                ],
                rowsPerPage: 8,
                source: _postsDataSource,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
