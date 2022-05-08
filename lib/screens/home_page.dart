// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/screens/form_page.dart';
import 'package:why_not_143_team/screens/menu/profile_page.dart';
import 'package:why_not_143_team/services/firebase_auth_method.dart';
import 'package:why_not_143_team/widget/menu_item_widget.dart';

import '../constant.dart/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late int defaultChoiceIndex;

  double? screenHeight, screenWidth;
  bool openMenu = false;
  final List<String> _choicesList = ['Tümü', 'Kedi', 'Köpek'];

  @override
  void initState() {
    defaultChoiceIndex = 0;
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      _menu(_firebaseUser, context),
      AnimatedPositioned(
          top: openMenu ? 0.1 * screenHeight! : 0,
          bottom: openMenu ? 0.2 * screenWidth! : 0,
          left: openMenu ? 0.5 * screenWidth! : 0,
          duration: const Duration(milliseconds: 500),
          child: Material(
            color: ColorConstant.instance.white,
            elevation: 15,
            borderRadius:
                openMenu ? const BorderRadius.all(Radius.circular(20)) : null,
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _homeAppBar(),
                        if (_firebaseUser != null)
                          ElevatedButton(
                              onPressed: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const FormPage())));
                              },
                              child: Text("Patim ol"))
                        else
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteConstant.loginScreenRoute);
                            },
                            child: Text("Patim ol"),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ))
    ])));
  }

  SlideTransition _menu(User? _firebaseUser, BuildContext context) {
    String? photoUrl = _firebaseUser!.photoURL;
    String? userName = _firebaseUser.displayName;
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        height: screenHeight,
        color: ColorConstant.instance.white,
        child: Padding(
          padding: EdgeInsets.only(left: 18.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _firebaseUser != null
                      ? Padding(
                          padding: PaddingConstant.instance.loginPadding,
                          child: SizedBox(
                            height: 75.h,
                            width: 75.w,
                            child: Image.network(photoUrl!),
                          ),
                        )
                      : SizedBox(
                          height: 75.h,
                          width: 75.w,
                          child: Image.asset(AssetPath.instance.menuPerson),
                        ),
                  SizedBox(
                    height: 16.h,
                  ),
                  if (_firebaseUser != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstant.profileRoute);
                      },
                      child: MenuItem(
                        icons: Icons.person,
                        text: userName!,
                        page: RouteConstant.profileRoute,
                      ),
                    )
                  else
                    MenuItem(
                      icons: Icons.person,
                      text: StringConstant.instance.menuPerson,
                      page: RouteConstant.profileRoute,
                    ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MenuItem(
                    icons: Icons.info_outline,
                    text: StringConstant.instance.menuAbout,
                    page: RouteConstant.aboutScreenRoute,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MenuItem(
                    icons: Icons.send,
                    text: StringConstant.instance.menuSendBack,
                    page: RouteConstant.feedBackScreenRoute,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MenuItem(
                    icons: Icons.star,
                    text: StringConstant.instance.menuRateOurApp,
                    page: RouteConstant.homeScreenRoute,
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<FirebaseAuthMethods>()
                              .signOut(context)
                              .then((value) => Navigator.pushNamed(
                                  context, RouteConstant.coverScreenRoue));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: ColorConstant.instance.yankeBlue,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                StringConstant.instance.logOut,
                                style:
                                    TextStyleConstant.instance.textLargeRegular,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

  _homeAppBar() {
    return AppBar(
      leadingWidth: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          setState(() {
            openMenu = !openMenu;
          });
        },
        icon: Icon(
          Icons.menu,
          color: ColorConstant.instance.yankeBlue,
        ),
      ),
      centerTitle: true,
      title: Text(StringConstant.instance.homePage,
          style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue)),
    );
  }
}

/*  SizedBox _homeBody(BuildContext context) {
    return SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _homeAppBar(),
                    const _SearchWidget(),
                    if (firebaseUser != null)
                      ElevatedButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const FormPage())));
                          },
                          // ignore: prefer_const_constructors
                          child: Text("Patim ol"))
                    else
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteConstant.loginScreenRoute);
                        },
                        child: Text("Patim ol"),
                      ),
                    /*const _SearchWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 25),
                  child: Wrap(
                    spacing: 8,
                    children: List.generate(_choicesList.length, (index) {
                      return ChoiceChip(
                        labelPadding: const EdgeInsets.all(2.0),
                        label: Text(_choicesList[index],
                            style: TextStyleConstant
                                .instance.textSmallMedium
                                .copyWith(
                                    color: ColorConstant.instance.white)),
                        selected: defaultChoiceIndex == index,
                        selectedColor: ColorConstant.instance.yankeBlue,
                        onSelected: (value) {
                          setState(() {
                            defaultChoiceIndex =
                                value ? index : defaultChoiceIndex;
                          });
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        elevation: 0,
                      );
                    }),
                  ),
                ),
              ],
                )),*/
                    /*Column(
              children: [
                //TODO: Hayvanlar listesi, geçici liste

                SizedBox(
              height: 250.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
            )*/
                  ])
            ]));
  }
*/

//TODO: Responsive
/* class _SocialCard extends StatelessWidget {
  const _SocialCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 70.h),
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
              StringConstant.instance.homeSocialText,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 5.h),
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
          hintText: StringConstant.instance.searchText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.instance.black)),
        ),
      ),
    );
  }
}
*/