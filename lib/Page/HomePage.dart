import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/Page/DepositPage.dart';
import 'package:luggagemanagementsystem/Page/DrawPage.dart';
import 'package:luggagemanagementsystem/Page/PersonalPage.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  //当前页面
  int _currentIndex;

  //定义页面控制器，可以左右滑动切换页面
  PageController pageController = new PageController(initialPage: 0);

  //页面分别为：寄存、领取、个人
  List pages = [
    DepositPage(),
    DrawPage(),
    PersonalPage(),
  ];

  //底部导航栏按钮点击事件
  //动画切换页面
  void _onTapHandler(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  //滑动切换页面
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //初始化当前页面为第一个寄存界面
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    // TODO: implement build
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('${MyLocalizations.of(context).appBarText}'),
        //Text("智能酒店行李寄存管理系统"),
      ),
      body: PageView.builder(
          onPageChanged: _onPageChanged,
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapHandler,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.teal,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel),
                title: Text('${MyLocalizations.of(context).depositText}')),
            BottomNavigationBarItem(
                icon: Icon(Icons.redeem),
                title: Text('${MyLocalizations.of(context).drawText}')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('${MyLocalizations.of(context).personalText}')),
          ]),
    );
  }
}
