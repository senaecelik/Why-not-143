import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/screens/cover_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: ColorConstant.instance.yankeBlue,
              ),
              home: const CoverPage());
        });
  }
}
