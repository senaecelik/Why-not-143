import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/home_page.dart';
import 'package:why_not_143_team/screens/form_page.dart';
import 'package:why_not_143_team/screens/menu/about_page.dart';
import 'package:why_not_143_team/screens/menu/feed_back_page.dart';
import 'package:why_not_143_team/screens/menu/profile_page.dart';
import 'package:why_not_143_team/screens/my_pets_page.dart';
import 'package:why_not_143_team/screens/search_page.dart';

class TransitionPage extends StatefulWidget {
  final zoomDrawerController;

  TransitionPage(this.zoomDrawerController);

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  final DrawerController = ZoomDrawerController();
  int currentIndex = 0;
  final Screens = [
    HomePage(),
    SearchPage(),
    MyPetsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedItemColor: ColorConstant.instance.azureishWhite,
        selectedItemColor: ColorConstant.instance.white,
        backgroundColor: ColorConstant.instance.yankeBlue,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: ColorConstant.instance.white,
              ),
              label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: ColorConstant.instance.white,
              ),
              label: "Arama"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pets,
                color: ColorConstant.instance.white,
              ),
              label: "Hayvanlarım"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: ColorConstant.instance.white,
              ),
              label: "Profil"),
        ],
      ),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => widget.zoomDrawerController.toggle(),
          child: Icon(Icons.menu),
        ),
      ),
      body: Screens[currentIndex],
    );
  }
}
