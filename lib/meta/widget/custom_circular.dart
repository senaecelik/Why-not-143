import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';

Widget customCircular(){
  return SizedBox(
    height: 100.h,
    width: 100.w,
    child: Image.asset(AssetPath.instance.circul),
  );
}