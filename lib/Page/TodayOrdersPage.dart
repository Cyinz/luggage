import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayOrdersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodayOrdersState();
  }
}

class TodayOrdersState extends State<TodayOrdersPage> {
  //当天行李件数
  int _todayNumbers;

  final _todayOrdersFormKey = GlobalKey<FormState>();
  String _today =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

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
        _today = '${date.year}-${date.month}-${date.day}';
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('统计某一日期行李件数'),
      ),
      body: Form(
        key: _todayOrdersFormKey,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '选择日期：',
                  ),
                  InkWell(
                    onTap: _selectDate,
                    child: Text(
                      _today,
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setHeight(32.0)),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(30.0),
              ),
              Text('当天行李件数：')
            ],
          ),
        ),
      ),
    );
  }
}
