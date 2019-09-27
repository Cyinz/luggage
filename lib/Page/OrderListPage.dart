import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

//订单列表信息
List responseJson;

int _rowCount = 0;

BuildContext _context;

String storeTo;

//日期选择器返回时间
_selectDate() async {
  DateTime date = await showDatePicker(
      context: _context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(new Duration(days: 1)),
      lastDate: DateTime(2100));

  if (date == null) {
    return;
  } else {
    storeTo = '${date.year}-${date.month}-${date.day}';
  }
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
              storeTo = '${_posts[index]['luggagegetcode'].toString()}';
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
                            0: FixedColumnWidth(ScreenUtil.getInstance().setWidth(80.0),),
                            1: FixedColumnWidth(ScreenUtil.getInstance().setWidth(300.0),),
                          },
                          children: [
                            TableRow(children: [
                              Container(
                                height: ScreenUtil.getInstance().setHeight(80.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '姓名：',
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
                                  initialValue: '${_posts[index]['savername'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {

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
                                    '手机号：',
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
                                  initialValue: '${_posts[index]['saverphonenumber'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {

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
                                    '件数：',
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
                                  initialValue: '${_posts[index]['luggagedecribe'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {

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
                                    '描述：',
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
                                  initialValue: '${_posts[index]['luggagedecribe'].toString()}',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  onSaved: (String value) {

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
                                    '寄存时间：',
                                    style: TextStyle(
                                      fontSize:
                                      ScreenUtil.getInstance().setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              //luggagesavetime
                              Container(
                                alignment: Alignment.centerLeft,
                                height: ScreenUtil.getInstance().setHeight(80.0),
                                child: Text('${_posts[index]['luggagesavetime'].toString()}'),
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
                                    '存放至：',
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
                                    '取行李码：',
                                    style: TextStyle(
                                      fontSize:
                                      ScreenUtil.getInstance().setWidth(35.0),
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: ScreenUtil.getInstance().setHeight(80.0),
                                child: Text(storeTo),
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
            child: Text('修改订单',style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    );
  }

  //排序
  void _sort() {}
}

class OrderListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderListPageState();
  }
}

class OrderListPageState extends State<OrderListPage> {
  //行李员姓名
  String _name;

  //排序的索引号
  int _sortColumnIndex;

  //排序用的方法  升序
  bool _sortAscending = true;

  //表格数据源
  PostDataSource _postsDataSource = PostDataSource();

  //获取行李员信息
  getMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _name = sharedPreferences.getString('username');

      getOrderlist(_name);
    });
  }

  //通过行李员姓名获取订单列表
  getOrderlist(String name) async {
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

  Widget _listitembuilder(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          height: ScreenUtil.getInstance().setHeight(80),
          width: ScreenUtil.getInstance().setWidth(360.0),
          color: Colors.blue,
          child: Text(responseJson[index]['savername'].toString()),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(80),
          width: ScreenUtil.getInstance().setWidth(360.0),
          color: Colors.blue,
          child: Text(responseJson[index]['saverphonenumber'].toString()),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(80),
          width: ScreenUtil.getInstance().setWidth(360.0),
          color: Colors.blue,
          child: Text(responseJson[index]['luggageistoken'].toString()),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _context = context;
    });
    // TODO: implement build
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('订单列表'),
      ),
      body: Container(
        //color: Colors.red,
        height: ScreenUtil.getInstance().setHeight(1680.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              dataRowHeight: ScreenUtil.getInstance().setHeight(132.0),
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
                    alignment: Alignment.center,
                    width: ScreenUtil.getInstance().setWidth(200.0),
                    child: Text('修改订单'),
                  ),
                ),
              ],
              header: Row(
                children: <Widget>[
                  Text('经手订单'),
                ],
              ),
              rowsPerPage: 10,
              source: _postsDataSource,
            ),
          ],
        ),
      ),
    );
  }
}
