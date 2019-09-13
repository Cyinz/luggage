import 'package:flutter/material.dart';

class MyLocalizations {
  final Locale _locale;

  MyLocalizations(this._locale);

  static Map<String, Map<String, String>> _localizedValuesMap = {
    'en_US': {
      'skip_text': 'Skip',
      'appBar_text': 'LuggageManagement',
      'forgetPassword_text': 'Forget password',
      'loginSuccessTitle_text': 'Login Success',
      'loginFailureTitle_text': 'Login Failed',
      'loginSuccessContent_text': 'User name password correct',
      'loginFailureContent_text': 'Error in username or password',
      'define_text': 'Define',
      'cancel_text': 'Cancel',
      'deposit_text': 'Deposit',
      'draw_text': 'Receive',
      'personal_text': 'Personal',
      'depositOrder_text': 'Deposit Order',
      'name_text': 'Name',
      'gender_text': 'Gender',
      'phone_text': 'Phone',
      'storeTo_text': 'Store to',
      'piece_text': 'Pieces',
      'pieces_text': 'Pieces',
      'describe_text': 'Describe',
      'pleaseEnterName_text': 'Please enter your name',
      'pleaseEnterPhone_text': 'Please enter your phone number',
      'pleaseEnterDescribe_text': 'Please enter the baggage description',
      'pleaseEnterPieces_text': 'Please enter the number of pieces',
      'male_text': 'Male',
      'female_text': 'Female',
    },
    'zh_CN': {
      'skip_text': '跳过',
      'appBar_text': '智能酒店行李管理系统',
      'forgetPassword_text': '忘记密码',
      'loginSuccessTitle_text': '登陆成功',
      'loginFailureTitle_text': '登陆失败',
      'loginSuccessContent_text': '用户名密码正确',
      'loginFailureContent_text': '用户名或密码错误',
      'define_text': '确定',
      'cancel_text': '取消',
      'deposit_text': '寄存',
      'draw_text': '领取',
      'personal_text': '我的',
      'depositOrder_text': '行李寄存',
      'name_text': '姓名',
      'gender_text': '性别',
      'phone_text': '手机号',
      'storeTo_text': '存放至',
      'piece_text': '件',
      'pieces_text': '件数',
      'describe_text': '备注',
      'pleaseEnterName_text': '请输入姓名',
      'pleaseEnterPhone_text': '请输入手机号',
      'pleaseEnterDescribe_text': '请输入行李描述',
      'pleaseEnterPieces_text': '请选择件数',
      'male_text': '先生',
      'female_text': '女士',
    },
    'zh_HK': {
      'skip_text': '跳過',
      'appBar_text': '智能酒店行李管理系統',
      'forgetPassword_text': '忘記密碼',
      'loginSuccessTitle_text': '登陸成功',
      'loginFailureTitle_text': '登陸失敗',
      'loginSuccessContent_text': '用戶名密碼正確',
      'loginFailureContent_text': '用戶名或密碼錯誤',
      'define_text': '確定',
      'cancel_text': '取消',
      'deposit_text': '寄存',
      'draw_text': '領取',
      'personal_text': '我的',
      'depositOrder_text': '行李寄存',
      'name_text': '姓名',
      'gender_text': '性別',
      'phone_text': '手機號',
      'storeTo_text': '存放至',
      'piece_text': '件',
      'pieces_text': '件數',
      'describe_text': '備註',
      'pleaseEnterName_text': '請輸入姓名',
      'pleaseEnterPhone_text': '請輸入手機號',
      'pleaseEnterDescribe_text': '請輸入行李描述',
      'pleaseEnterPieces_text': '請選擇件數',
      'male_text': '先生',
      'female_text': '女士',
    }
  };

  get appBarText {
    return _localizedValuesMap[_locale.toString()]['appBar_text'];
  }

  get skipText {
    return _localizedValuesMap[_locale.toString()]['skip_text'];
  }

  get forgetPasswordText {
    return _localizedValuesMap[_locale.toString()]['forgetPassword_text'];
  }

  get loginSuccessTitleText {
    return _localizedValuesMap[_locale.toString()]['loginSuccessTitle_text'];
  }

  get loginFailureTitleText {
    return _localizedValuesMap[_locale.toString()]['loginFailureTitle_text'];
  }

  get loginSuccessContentText {
    return _localizedValuesMap[_locale.toString()]['loginSuccessContent_text'];
  }

  get loginFailureContentText {
    return _localizedValuesMap[_locale.toString()]['loginFailureContent_text'];
  }

  get defineText {
    return _localizedValuesMap[_locale.toString()]['define_text'];
  }

  get cancelText {
    return _localizedValuesMap[_locale.toString()]['cancel_text'];
  }

  get depositText {
    return _localizedValuesMap[_locale.toString()]['deposit_text'];
  }

  get drawText {
    return _localizedValuesMap[_locale.toString()]['draw_text'];
  }

  get personalText {
    return _localizedValuesMap[_locale.toString()]['personal_text'];
  }

  get depositOrderText {
    return _localizedValuesMap[_locale.toString()]['depositOrder_text'];
  }

  get nameText {
    return _localizedValuesMap[_locale.toString()]['name_text'];
  }

  get genderText {
    return _localizedValuesMap[_locale.toString()]['gender_text'];
  }

  get phoneText {
    return _localizedValuesMap[_locale.toString()]['phone_text'];
  }

  get storeToText {
    return _localizedValuesMap[_locale.toString()]['storeTo_text'];
  }

  get pieceText {
    return _localizedValuesMap[_locale.toString()]['piece_text'];
  }

  get piecesText {
    return _localizedValuesMap[_locale.toString()]['pieces_text'];
  }

  get describeText {
    return _localizedValuesMap[_locale.toString()]['describe_text'];
  }

  get pleaseEnterNameText {
    return _localizedValuesMap[_locale.toString()]['pleaseEnterName_text'];
  }

  get pleaseEnterPhoneText {
    return _localizedValuesMap[_locale.toString()]['pleaseEnterPhone_text'];
  }

  get pleaseEnterDescribeText {
    return _localizedValuesMap[_locale.toString()]['pleaseEnterDescribe_text'];
  }

  get pleaseEnterPiecesText {
    return _localizedValuesMap[_locale.toString()]['pleaseEnterPieces_text'];
  }

  get maleText {
    return _localizedValuesMap[_locale.toString()]['male_text'];
  }

  get femaleText {
    return _localizedValuesMap[_locale.toString()]['female_text'];
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }
}
