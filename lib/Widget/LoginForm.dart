import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/Page/HomePage.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  //登陆账号
  String _userLoginName;
  //登陆密码
  String _password;
  //是否隐藏密码
  bool _isObscure = true;
  //隐藏显示密码小眼睛颜色
  Color _eyeColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Form(
      key: _loginFormKey,
      child: ListView(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil.getInstance().setWidth(20.0),
            ScreenUtil.getInstance().setHeight(200.0),
            ScreenUtil.getInstance().setWidth(20.0),
            0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(60.0),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: ScreenUtil(allowFontScaling: true).setWidth(120.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil.getInstance().setWidth(70.0),
                ScreenUtil.getInstance().setHeight(10.0),
                0,
                0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.black,
                width: ScreenUtil.getInstance().setWidth(120.0),
                height: ScreenUtil.getInstance().setHeight(6.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil.getInstance().setWidth(60.0),
                ScreenUtil.getInstance().setHeight(250.0),
                ScreenUtil.getInstance().setWidth(60.0),
                0),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'UserLoginName',
                helperText: '',
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return "账号不能为空！";
                }
              },
              onSaved: (String value) => _userLoginName = value,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil.getInstance().setWidth(60.0),
                0,
                ScreenUtil.getInstance().setWidth(60.0),
                0),
            child: TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                  icon: Icon(Icons.keyboard),
                  labelText: 'Password',
                  helperText: '',
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: _eyeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                          _eyeColor = _isObscure
                              ? Colors.grey
                              : Theme.of(context).iconTheme.color;
                        });
                      })),
              validator: (String value) {
                if (value.isEmpty) {
                  return "密码不能为空！";
                }
              },
              onSaved: (String value) => _password = value,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: ScreenUtil.getInstance().setHeight(60.0),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  '${MyLocalizations.of(context).forgetPasswordText}',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setHeight(35.0),
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Align(
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().setHeight(200.0)),
              width: ScreenUtil.getInstance().setWidth(700.0),
              height: ScreenUtil.getInstance().setHeight(100.0),
              child: RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setHeight(70.0),
                    //ScreenUtil(allowFontScaling: true).setSp(80.0),
                  ),
                ),
                color: Colors.black,
                onPressed: () {
                  //所有输入验证成功通过后
                  if (_loginFormKey.currentState.validate()) {
                    _loginFormKey.currentState.save();
                    //登陆
                    login(_userLoginName, _password);
                  }
                },
                shape: StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  login(String userloginname, String password) async {
    print("userloginname : ${userloginname}, password : ${password}");

//    Response response;
//    FormData formData = FormData.from({
//      'userloginname': userloginname,
//      'password': password,
//    });
//    response = await Dio()
//        .post('http://192.168.31.71:8080/user/userLogin', data: formData);

    //登陆成功返回的Json
    String successJson =
        '{"status":200, "msg":"用户名密码正确", "data":{"username":"行李员甲", "img":"default", "right":1, "hotel":"国际交流中心"},"ok":true}';
    //登陆失败返回的Json
    String failureJson =
        '{"status":500,"msg":"用户名或密码错误","data":null,"ok":false}';

    Map<String, dynamic> data = json.decode(successJson);
    //Map<String, dynamic> data = json.decode(successJson);
    print(data);

    //登陆后弹出登陆成功/失败警告框
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (data['status'] == 200) {
            return AlertDialog(
              title:
                  Text('${MyLocalizations.of(context).loginSuccessTitleText}'),
              content: Text(
                  '${MyLocalizations.of(context).loginSuccessContentText}'),
              //Text(data['msg']),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Map<String, dynamic> userdata = data['data'];
                    //行李员姓名
                    String _username = userdata['username'];
                    //行李员头像地址
                    String _img = userdata['img'];
                    //行李员权限
                    int _right = userdata['right'];
                    //行李员所属酒店
                    String _hotel = userdata['hotel'];
                    //保存行李员信息
                    saveUserMessage(_username, _img, _right, _hotel);

                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => route == null);
                  },
                  child: Text('${MyLocalizations.of(context).defineText}'),
                ),
              ],
            );
          } else if (data['status'] == 500) {
            return AlertDialog(
              title:
                  Text('${MyLocalizations.of(context).loginFailureTitleText}'),
              content: Text(
                  '${MyLocalizations.of(context).loginFailureContentText}'),
              //Text(data['msg']),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    //清空Form
                    _loginFormKey.currentState.reset();
                    Navigator.of(context).pop();
                  },
                  child: Text('${MyLocalizations.of(context).defineText}'),
                )
              ],
            );
          }
        });

    //saveUserMessage(userloginname, password);

    //Navigator.of(context).pushReplacementNamed("/");
  }

  //保存行李员信息
  saveUserMessage(String username, String img, int right, String hotel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('username', username);
    sharedPreferences.setString('img', img);
    sharedPreferences.setInt('right', right);
    sharedPreferences.setString('hotel', hotel);
  }
}
