import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/screens/home_page.dart';
import 'package:why_not_143_team/screens/menu/about_page.dart';
import 'package:why_not_143_team/screens/menu/feed_back_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
  late int defaultChoiceIndex;

  double? screenHeight, screenWidth;
  bool openMenu = false;

  @override
  int index = 0;
  final screens = [
    HomePage(),
    FeedBackPage(),
    AboutPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: ColorConstant.instance.columbiaBlue,
              labelTextStyle: MaterialStateProperty.all(
                TextStyleConstant.instance.loginVerySmallMedium,
              ),
            ),
            child: NavigationBar(
              selectedIndex: index,
              backgroundColor: Colors.white,
              onDestinationSelected: (index) =>
                  setState((() => this.index = index)),
              height: 60.h,
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home), label: "Ana Sayfa"),
                NavigationDestination(icon: Icon(Icons.search), label: "Arama"),
                NavigationDestination(
                    icon: Icon(Icons.pets), label: "Hayvanlarım"),
                NavigationDestination(
                    icon: Icon(Icons.person), label: "Profil"),
              ],
            ),
          ),
          body: screens[index]),
    );
  }
}
