import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';

Widget CustomCircular(){
  return Container(
    height: 100.h,
    width: 100.w,
    child: Image.asset(AssetPath.instance.circul),
  );
}