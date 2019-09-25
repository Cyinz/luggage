import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/Page/HomePage.dart';
import 'package:luggagemanagementsystem/Page/LanguagePage.dart';
import 'package:luggagemanagementsystem/Page/LoadPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luggagemanagementsystem/Page/LoginPage.dart';
import 'package:luggagemanagementsystem/Page/LosePage.dart';
import 'package:luggagemanagementsystem/Page/OrderListPage.dart';
import 'package:luggagemanagementsystem/Page/TodayOrdersPage.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizationsDelegate.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class _AppSetting {
  _AppSetting();

  Null Function(Locale locale) changeLocale;
  Locale _locale;
  List<Locale> _supportedLocales = [
    Locale('zh', 'CN'), //简体中文
    Locale('zh', 'HK'), //繁体中文
    Locale('en', 'US'), //美国英语
  ];
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  static _AppSetting setting = _AppSetting();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setting.changeLocale = (Locale locale) {
      if (setting._supportedLocales
          .map((locale) {
            return locale.toString();
          })
          .toSet()
          .contains(locale?.toString())) {
        setState(() {
          setting._locale = locale;
        });
      }
    };

    var permission = PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print('permisson status is ${permission.toString()}');
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      onGenerateTitle: (context){
//        return MyLocalizations.of(context).testText;
//      },
      locale: setting._locale,
      //本地化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyLocalizationsDelegate(),
      ],
      //本地化支持的语言
      supportedLocales: setting._supportedLocales,
      debugShowCheckedModeBanner: false,
      //应用初始加载路由，打开应用首先打开加载页
      initialRoute: "/load",
      routes: {
        //主页
        '/': (context) => HomePage(),
        //注册页面
        '/login': (context) => LoginPage(),
        //加载页面
        '/load': (context) => LoadPage(),
        //丢失凭证页面
        '/lose': (context) => LosePage(),
        //订单列表页面
        '/orderlist': (context) => OrderListPage(),
        //语言设置页面
        '/language': (context) => LanguagePage(),
        //统计某一日期的行李件数
        '/today' : (context) => TodayOrdersPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
