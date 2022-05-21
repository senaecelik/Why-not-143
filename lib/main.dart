import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/helper/route/route_generator.dart';
import 'package:why_not_143_team/meta/view/menu/drawer_page.dart';
import 'package:why_not_143_team/meta/view/splash/splash_screen_page.dart';
import 'meta/helper/constant/color_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(
              FirebaseAuth.instance, FirebaseFirestore.instance),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null)
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, Text) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              initialRoute: RouteConstant.coverScreenRoue,
              onGenerateRoute: RouterGenerator.generateRoute,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: appBarTheme(),
                brightness: Brightness.light,
                primaryColor: ColorConstant.instance.yankeBlue,
              ),
              home: const AuthWrapper(),
            );
          }),
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      titleTextStyle: TextStyleConstant.instance.title1,
      iconTheme: IconThemeData(color: ColorConstant.instance.yankeBlue),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const DrawerPage();
    }
    return const SplashView();
  }
}
