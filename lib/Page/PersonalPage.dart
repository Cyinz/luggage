import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizationsDelegate.dart';
import 'package:luggagemanagementsystem/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonalState();
  }
}

class PersonalState extends State<PersonalPage> {
  //行李员姓名
  String name;
  //行李员所属酒店
  String hotel;
  //获取行李员信息
  getMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString('username');
      hotel = sharedPreferences.getString('hotel');
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
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          margin:
              EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(30.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.black26,
                    height: ScreenUtil.getInstance().setHeight(2.0),
                  ),
                  Container(
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('images/pic.png'),
                        width: ScreenUtil.getInstance().setWidth(300),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setHeight(10.0)),
                child: Text(
                  '${MyLocalizations.of(context).nameText}：${name}',
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setHeight(38.0)),
                ),
              ),
              Container(
                child: Text(
                  '${MyLocalizations.of(context).hotelText}：${hotel}',
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setHeight(38.0)),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setHeight(20.0)),
                      height: ScreenUtil.getInstance().setHeight(120.0),
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){
                          Fluttertoast.showToast(
                            msg: '暂无此功能',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                          );
                        },
                        leading: Icon(
                          Icons.person_outline,
                          color: Colors.teal,
                        ),
                        title: Text('${MyLocalizations.of(context).personalInformationText}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[350],
                        ),
                      ),
                    ),
                    Divider(
                      height: ScreenUtil.getInstance().setHeight(1.0),
                    ),
                    Container(
                      height: ScreenUtil.getInstance().setHeight(120.0),
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed('/orderlist');
                        },
                        leading: Icon(
                          Icons.list,
                          color: Colors.teal,
                        ),
                        title: Text('${MyLocalizations.of(context).orderListText}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[350],
                        ),
                      ),
                    ),
                    Divider(
                      height: ScreenUtil.getInstance().setHeight(1.0),
                    ),
                    Container(
                      height: ScreenUtil.getInstance().setHeight(120.0),
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.teal,
                        ),
                        title: Text('${MyLocalizations.of(context).languageSettingText}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[350],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/language');
                        },
                      ),
                    ),
                    Divider(
                      height: ScreenUtil.getInstance().setHeight(2.0),
                    ),
                    Container(
                      height: ScreenUtil.getInstance().setHeight(120.0),
                      color: Colors.white,
                      child: ListTile(
                        onTap: (){
                          Fluttertoast.showToast(
                            msg: '暂无此功能',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                          );
                        },
                        leading: Icon(
                          Icons.update,
                          color: Colors.teal,
                        ),
                        title: Text('${MyLocalizations.of(context).checkUpdateText}'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[350],
                        ),
                      ),
                    ),
                    Divider(
                      height: ScreenUtil.getInstance().setHeight(1.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(150.0),
                    right: ScreenUtil.getInstance().setWidth(150.0),
                    bottom: ScreenUtil.getInstance().setHeight(40.0)),
                child: RaisedButton(
                  color: Colors.red,
                  child: Container(
                    height: ScreenUtil.getInstance().setHeight(100.0),
                    alignment: Alignment.center,
                    child: Text(
                      "${MyLocalizations.of(context).quitText}",
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setHeight(50.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
