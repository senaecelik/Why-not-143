import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingConstant {
  static PaddingConstant instance = PaddingConstant._init();
  PaddingConstant._init();

  EdgeInsets appNamePadding = const EdgeInsets.only(top: 10).r;
  //login and register
  EdgeInsets genelPadding = const EdgeInsets.fromLTRB(20, 10, 20, 10).r;
  EdgeInsets textPadding = const EdgeInsets.fromLTRB(20, 0, 20, 0).r;
  EdgeInsets genelButtonPadding = const EdgeInsets.fromLTRB(20, 20, 20, 20).r;
  //menu
  EdgeInsets menuPadding = const EdgeInsets.fromLTRB(10, 20, 10, 10).r;
  //button
  EdgeInsets buttonPadding = const EdgeInsets.fromLTRB(20, 10, 20, 10).r;
  //home
  EdgeInsets homePadding = const EdgeInsets.fromLTRB(20, 10, 20, 0).r;
}
