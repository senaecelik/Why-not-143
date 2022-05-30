import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';

class ButtonStyleConstant {
  static ButtonStyleConstant instance = ButtonStyleConstant._init();

  ButtonStyleConstant._init();

  final genelButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    primary: ColorConstant.instance.yankeBlue,
    onPrimary: ColorConstant.instance.white,
    side: BorderSide(width: 1.0, color: ColorConstant.instance.yankeBlue),
  );

  final whiteButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    primary: ColorConstant.instance.white,
    onPrimary: ColorConstant.instance.yankeBlue,
    side: BorderSide(width: 1.0, color: ColorConstant.instance.yankeBlue),
  );
}
