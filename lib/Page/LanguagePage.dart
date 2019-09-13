import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/main.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LanguageState();
  }
}

class LanguageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('语言设置'),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: () {
              MyAppState.setting.changeLocale(Locale('zh', 'CN'));
              Navigator.of(context).pop();
            },
            child: Container(
              child: Align(
                child: Text('中文简体'),
              ),
            ),
          ),
          OutlineButton(
            onPressed: () {
              MyAppState.setting.changeLocale(Locale('zh', 'HK'));
              Navigator.of(context).pop();
            },
            child: Container(
              child: Align(
                child: Text('中文繁體'),
              ),
            ),
          ),
          OutlineButton(
            onPressed: () {
              MyAppState.setting.changeLocale(Locale('en', 'US'));
              Navigator.of(context).pop();
            },
            child: Container(
              child: Align(
                child: Text('English(US)'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
