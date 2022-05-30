import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyBox {
  static EmptyBox instance = EmptyBox._init();

  EmptyBox._init();

  final emptyBoxSmall = SizedBox(
    height: 10.h,
  );
  final emptyBoxMedium = SizedBox(
    height: 10.h,
  );
  final emptyBoxNormal = SizedBox(
    height: 20.h,
  );
  final emptyBoxBig = SizedBox(
    height: 30.h,
  );
  final emptyBoxLarge = SizedBox(
    height: 50.h,
  );

  final emptyBoxXxLarge = SizedBox(
    height: 100.h,
  );

  final emptyBoxSmallWidth = SizedBox(
    width: 10.w,
  );

   final emptyBoxNormalWidth = SizedBox(
    width: 20.w,
  );
}
