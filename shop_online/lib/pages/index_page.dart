import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_online/pages/cart_page.dart';
import 'package:shop_online/pages/category_page.dart';
import 'package:shop_online/pages/home_page.dart';
import 'package:shop_online/pages/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  //当前页面索引,默认索引为0，对应首页页面
  int _currentIndex = 0;

  //当前页面
  var _currentPage;

  //底部导航栏
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心'),
    ),
  ];

  //主页、分类、购物车、会员中心页面
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //初始化设置当前页面
    _currentPage = tabBodies[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: tabBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //设置底部导航栏类型，不设置时超过3个会报错
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _currentPage = tabBodies[_currentIndex];
          });
        },
      ),
    );
  }
}
