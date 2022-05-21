import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingConstant {
  static PaddingConstant instance = PaddingConstant._init();

  PaddingConstant._init();

  EdgeInsets onBoardPadding = const EdgeInsets.symmetric(horizontal: 34).r;
  EdgeInsets appNamePadding = const EdgeInsets.only(top: 10).r;
  //login and register
  EdgeInsets loginPadding = const EdgeInsets.fromLTRB(35, 10, 30, 10).r;
  EdgeInsets genelButtonPadding = const EdgeInsets.fromLTRB(35, 10, 30, 0).r;
  //menu
  EdgeInsets menuPadding = const EdgeInsets.fromLTRB(10, 20, 10, 10).r;

  //button
  EdgeInsets buttonPadding = const EdgeInsets.fromLTRB(30, 10, 30, 10).r;
}
