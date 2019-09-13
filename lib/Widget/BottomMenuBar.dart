import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomMenuBarState();
  }
}

class BottomMenuBarState extends State<BottomMenuBar> {
  int _currentIndex;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel), title: Text("寄存")),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), title: Text("领取")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
        ]);
  }
}
