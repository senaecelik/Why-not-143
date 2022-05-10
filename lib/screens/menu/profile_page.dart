import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          children: [
            _firebaseUser != null
                ? Padding(
                    padding: PaddingConstant.instance.loginPadding,
                    child: SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: _firebaseUser.photoURL != null
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage("${_firebaseUser.photoURL}"),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage(AssetPath.instance.menuPerson),
                            ),
                    ),
                  )
                : Padding(
                    padding: PaddingConstant.instance.loginPadding,
                    child: DrawerHeader(
                      child: SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(AssetPath.instance.menuPerson),
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person),
                  SizedBox(width: 10.w),
                  Text(
                    "${_firebaseUser!.displayName}",
                    style: TextStyleConstant.instance.textLargeRegular,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mail),
                  SizedBox(width: 10.w),
                  Text(
                    "${_firebaseUser.email}",
                    style: TextStyleConstant.instance.textSmallRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        StringConstant.instance.appBarName,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
