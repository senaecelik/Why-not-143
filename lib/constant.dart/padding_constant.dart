import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingConstant {
  static PaddingConstant instance = PaddingConstant._init();

  PaddingConstant._init();

  EdgeInsets onBoardPadding = const EdgeInsets.symmetric(horizontal: 34);
  EdgeInsets appNamePadding = const EdgeInsets.only(top: 10);
  //login and register
  EdgeInsets loginPadding = const EdgeInsets.fromLTRB(35, 10, 35, 10).r;
}
