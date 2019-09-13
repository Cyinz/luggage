import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/Page/LoginPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/Util/MyLocalizations.dart';

class SkipButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SkipButtonState();
  }
}

class SkipButtonState extends State<SkipButton> with TickerProviderStateMixin {
  //动画控制器
  AnimationController animationDemoController;

  //倒计时秒数
  int _second;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //设置初始倒计时为3秒
    _second = 3;

    //设置动画控制器初始值
    animationDemoController = AnimationController(
      //初始值
      value: 3.0,
      //最小值
      lowerBound: 0.0,
      //最大值
      upperBound: 3.0,
      //动画毫秒数
      duration: Duration(milliseconds: 3000),
      //动画效果的异步处理
      vsync: this,
    );

    //动画监听器
    //更改倒计时秒数
    animationDemoController.addListener(() {
      if (animationDemoController.value < _second - 1) {
        setState(() {
          _second = _second - 1;
        });
      }
    });

    //动画倒置执行，从3到0
    animationDemoController.reverse();

    //动画状态监听器
    //倒计时结束后跳转到主页
    animationDemoController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pushNamed('/login');
        //Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => LoginPage()), (route) => route == null);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    animationDemoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //设置屏幕设计稿,默认 width:1080px, height:1920px
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Container(
      width: ScreenUtil.getInstance().setWidth(220.0),
      height: ScreenUtil.getInstance().setHeight(80.0),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black12.withOpacity(0.3),
        label: Text(
          "${MyLocalizations.of(context).skipText} ${_second}",
          style: TextStyle(
              color: Colors.amber,
              fontSize: ScreenUtil.getInstance().setHeight(38.0)),
        ),
        shape: StadiumBorder(),
        //点击事件
        //直接跳过倒计时跳转到主页
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/login');
          //Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => LoginPage()), (route) => route == null);
        },
      ),
    );
  }
}
