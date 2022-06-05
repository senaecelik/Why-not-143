import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/core/services/firebase/firebase_auth_method.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/helper/utils/show_toast_message.dart';
import 'package:why_not_143_team/meta/view/menu/profile_page.dart';
import 'package:why_not_143_team/meta/view/splash/splash_screen_page.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen(ZoomDrawerController drawerController, {Key? key})
      : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var userData = {};
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("Person")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snapshot.data()!;
      setState(() {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Scaffold(
      backgroundColor: ColorConstant.instance.yankeBlue,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            _menuAvatar(_firebaseUser, context),
            _menuDivider(),
            _menuPerson(_firebaseUser, context),
            if (_firebaseUser != null) const MenuMyPet(),
            MenuItem(
                icon: Icons.payments_outlined,
                text: StringConstant.instance.donate,
                pageRoute: RouteConstant.donateScreenRoute),
            _menuRateOurApp(),
            MenuItem(
                icon: Icons.double_arrow_rounded,
                text: StringConstant.instance.about,
                pageRoute: RouteConstant.aboutScreenRoute),
            MenuItem(
                icon: Icons.send,
                text: StringConstant.instance.menuSendBack,
                pageRoute: RouteConstant.feedBackScreenRoute),
            const LogOut(),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuAvatar(_firebaseUser, context) {
    return _firebaseUser != null
        ? Padding(
            padding: PaddingConstant.instance.genelPadding,
            child: DrawerHeader(
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: _firebaseUser.photoURL != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage("${_firebaseUser.photoURL}"),
                      )
                    : CircleAvatar(
                        backgroundColor: ColorConstant.instance.yankeBlue,
                        backgroundImage:
                            AssetImage(AssetPath.instance.menuPerson),
                      ),
              ),
            ),
          )
        : DrawerHeader(
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: CircleAvatar(
                backgroundColor: ColorConstant.instance.yankeBlue,
                backgroundImage: AssetImage(AssetPath.instance.menuPerson),
              ),
            ),
          );
  }

  Padding _menuRateOurApp() {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: _launchUrl,
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.star,
              color: ColorConstant.instance.white,
              size: 25,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              StringConstant.instance.menuRateOurApp,
              textAlign: TextAlign.center,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuPerson(_firebaseUser, context) {
    return _firebaseUser != null
        ? !_firebaseUser!.isAnonymous
            ? Padding(
                padding: PaddingConstant.instance.menuPadding,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: Row(
                    children: [
                      EmptyBox.instance.emptyBoxSmallWidth,
                      Icon(
                        Icons.person,
                        color: ColorConstant.instance.white,
                        size: 25,
                      ),
                      EmptyBox.instance.emptyBoxNormalWidth,
                      Flexible(
                        child: Text(
                          _firebaseUser.displayName ?? userData['username'],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyleConstant.instance.textSmallMedium
                              .copyWith(color: ColorConstant.instance.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Padding(
                padding: PaddingConstant.instance.menuPadding,
                child: InkWell(
                  onTap: () {
                    showToast(context, StringConstant.instance.loginMess);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Icon(
                        Icons.person,
                        color: ColorConstant.instance.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        StringConstant.instance.menuPerson,
                        textAlign: TextAlign.center,
                        style: TextStyleConstant.instance.textSmallMedium
                            .copyWith(color: ColorConstant.instance.white),
                      ),
                    ],
                  ),
                ),
              )
        : const Text("");
  }

  Divider _menuDivider() {
    return const Divider(
      color: Colors.white,
      indent: 20,
      endIndent: 45,
      thickness: 1,
    );
  }
}

class MenuMyPet extends StatelessWidget {
  const MenuMyPet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding: PaddingConstant.instance.menuPadding,
          child: InkWell(
            onTap: () {
              showToast(context, StringConstant.instance.commingSoonMess);
            },
            child: Row(
              children: [
                EmptyBox.instance.emptyBoxSmallWidth,
                Icon(
                  Icons.pets,
                  color: ColorConstant.instance.white,
                  size: 25,
                ),
                EmptyBox.instance.emptyBoxNormalWidth,
                Text(
                  StringConstant.instance.myPet,
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.instance.textSmallMedium
                      .copyWith(color: ColorConstant.instance.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SplashView()),
              (Route<dynamic> route) => false);
          context.read<FirebaseAuthMethods>().signOut(context);
        },
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.logout,
              color: ColorConstant.instance.white,
              size: 25,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              StringConstant.instance.logOut,
              textAlign: TextAlign.center,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final String pageRoute;
  const MenuItem(
      {required this.icon,
      required this.text,
      required this.pageRoute,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, pageRoute);
        },
        child: Row(
          children: [
            EmptyBox.instance.emptyBoxSmallWidth,
            Icon(
              icon,
              color: ColorConstant.instance.white,
              size: 25,
            ),
            EmptyBox.instance.emptyBoxNormalWidth,
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchUrl() async {
  final Uri _url = Uri.parse('https://github.com/senaecelik/Why-not-143');

  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
