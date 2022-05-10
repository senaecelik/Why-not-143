import 'package:flutter/material.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.yankeBlue,
      body: SafeArea(
        child: Column(
          children: [
            menuAvatar(),
            menuDivider(),
            SizedBox1(),
            menuPerson(),
            menuRateOurApp(),
            menuAbout(),
            menuSendBack(),
            SizedBox2(),
            menuLogout(),
          ],
        ),
      ),
    );
  }

  Padding menuLogout() {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {},
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

  SizedBox SizedBox2() {
    return SizedBox(
      height: 100.h,
    );
  }

  SizedBox SizedBox1() {
    return SizedBox(
      height: 30.h,
    );
  }

  Padding menuSendBack() {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.send,
              color: ColorConstant.instance.white,
              size: 25,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              StringConstant.instance.menuSendBack,
              textAlign: TextAlign.center,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
            ),
          ],
        ),
      ),
    );
  }

  Padding menuAbout() {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.double_arrow_rounded,
              color: ColorConstant.instance.white,
              size: 25,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              StringConstant.instance.menuAbout,
              textAlign: TextAlign.center,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
            ),
          ],
        ),
      ),
    );
  }

  Padding menuRateOurApp() {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {},
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

  Padding menuPerson() {
    return Padding(
      padding: PaddingConstant.instance.menuPadding,
      child: InkWell(
        onTap: () {},
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
    );
  }

  Divider menuDivider() {
    return const Divider(
      color: Colors.white,
      thickness: 1,
    );
  }

  Padding menuAvatar() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: DrawerHeader(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: CircleAvatar(
            backgroundImage: AssetImage(AssetPath.instance.menuPerson),
          ),
        ),
      ),
    );
  }
}
