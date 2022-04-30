import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingConstant {
  static PaddingConstant instance = PaddingConstant._init();

  PaddingConstant._init();

  EdgeInsets onBoardPadding = const EdgeInsets.symmetric(horizontal: 34);
  EdgeInsets appNamePadding = const EdgeInsets.only(top: 10);

  EdgeInsets loginPadding1 = const EdgeInsets.fromLTRB(33, 40, 0, 20).r;
  EdgeInsets loginPadding2 = const EdgeInsets.fromLTRB(33, 35, 0, 20).r;
  EdgeInsets loginPadding3 = const EdgeInsets.only(left: 28);
  EdgeInsets loginPadding4 =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  EdgeInsets loginPadding5 = const EdgeInsets.symmetric(vertical: 20);
  EdgeInsets loginPadding6 = const EdgeInsets.symmetric(vertical: 35);
}
