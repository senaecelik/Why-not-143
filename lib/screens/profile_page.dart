import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/screens/login_page.dart';
import 'package:why_not_143_team/screens/register_page.dart';

import '../constant.dart/color_constant.dart';
import '../constant.dart/string.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: Image.asset(AssetPath.instance.menuPerson),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person),
                  SizedBox(width: 10.w),
                  Text(
                    StringConstant.instance.profileName,
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
                    StringConstant.instance.profileMail,
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
