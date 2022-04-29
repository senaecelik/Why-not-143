import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

import '../constant.dart/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double? screenHeight, screenWidth;
  bool openMenu = false;

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Stack(
          children: [
            menu(context),
            dashboard(context),
          ],
        ),
      )),
    );
  }

  _homeAppBar() {
    return AppBar(
      leadingWidth: 80,
      backgroundColor: ColorConstant.instance.lightGray,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          setState(() {
            openMenu = !openMenu;
          });
        },
        icon: Icon(
          Icons.menu,
          color: ColorConstant.instance.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        StringConstant.instance.homePage,
        style: TextStyleConstant.instance.textLargeRegular
            .copyWith(color: ColorConstant.instance.black),
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    return AnimatedPositioned(
      top: openMenu ? 0.1 * screenHeight! : 0,
      bottom: openMenu ? 0.2 * screenWidth! : 0,
      left: openMenu ? 0.5 * screenWidth! : 0,
      duration: const Duration(milliseconds: 500),
      child: Material(
        color: ColorConstant.instance.white,
        elevation: 15,
        borderRadius:
            openMenu ? const BorderRadius.all(const Radius.circular(20)) : null,
        child: SingleChildScrollView(child: _homeBody(context)),
      ),
    );
  }

  Container _homeBody(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    color: ColorConstant.instance.lightGray,
                    borderRadius: openMenu
                        ? BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))
                        : BorderRadius.circular(0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _homeAppBar(),
                    const _SearchWidget()
                    //TODO: Chip yapılmalı,
                  ],
                )),
            Column(
              children: [
//TODO: Hayvanlar listesi, geçici liste

                Container(
                  height: 250.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      Image.asset(AssetPath.instance.coverImage),
                      Image.asset(AssetPath.instance.coverImage),
                      Image.asset(AssetPath.instance.coverImage),
                      Image.asset(AssetPath.instance.coverImage),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const _SocialCard()
              ],
            )
          ]),
    );
  }

//TODO: Menu itemleri düzenlenmeli
  Widget menu(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        height: screenHeight,
        color: ColorConstant.instance.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const SizedBox(
                    height: 66,
                    width: 66,
                    child: CircleAvatar(
                        //  backgroundImage: AssetImage("assets/Avatar.png"),
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Eduardo illiamson",
                  ),
                  const Text(
                    "San Fransico CA",
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  MenuItem(
                    icons: Icons.wallet_travel_outlined,
                    text: "Wallet",
                    page: const HomePage(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  MenuItem(
                    icons: Icons.send,
                    text: "Send Feedback",
                    page: const HomePage(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  MenuItem(
                    icons: Icons.star,
                    text: "Rate Our App",
                    page: const HomePage(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  MenuItem(
                    icons: Icons.support,
                    text: "View Our App",
                    page: const HomePage(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  MenuItem(
                    icons: Icons.notifications,
                    text: "Notification",
                    page: const HomePage(),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Row(
                    children: [
                      MenuItem(
                          text: "Log out",
                          icons: Icons.logout,
                          page: const HomePage())
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

//TODO: Responsive
class _SocialCard extends StatelessWidget {
  const _SocialCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 70.h, vertical: 30.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorConstant.instance.yankeBlue,
                ColorConstant.instance.yankeBlue.withOpacity(0.5),
              ],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sosyal sorumluluk projelerine katıl\nve ödüller kazan!",
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorConstant.instance.white)),
              child: Text(
                "Katıl",
                style: TextStyleConstant.instance.textSmallMedium
                    .copyWith(color: ColorConstant.instance.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: "Pati bul",
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.instance.black)),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  String text;
  IconData icons;
  Widget page;
  MenuItem(
      {Key? key, required this.text, required this.icons, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Row(
        children: [
          Icon(
            icons,
            color: ColorConstant.instance.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
