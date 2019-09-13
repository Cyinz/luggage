import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/Widget/LoginForm.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: LoginForm()),
    );
  }
}
