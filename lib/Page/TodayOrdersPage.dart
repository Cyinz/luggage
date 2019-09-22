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
      appBar: AppBar(),
      body: Form(
        key: _todayOrdersFormKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(15.0)),
                child: InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(
                        _today,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setHeight(32.0)),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
