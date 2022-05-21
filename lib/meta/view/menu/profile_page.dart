// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/widget/general_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileNameController = TextEditingController();
  final profileEmailController = TextEditingController();
  final profilePhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    var name = _firebaseUser!.displayName;
    var email = _firebaseUser.email;
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          children: [
            if (_firebaseUser != null)
              Padding(
                padding: PaddingConstant.instance.loginPadding,
                child: SizedBox(
                  height: 150.h,
                  width: 150.w,
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
            else
              Padding(
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
            /*
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
            ),*/
            profileNameText(),
            profileNameTextField(name),
            profileEmailText(),
            profileEmailTextField(email),
            profilePhoneText(),
            profilePhoneTextField(),
            updateButton(),
          ],
        ),
      ),
    );
  }

  Padding updateButton() {
    return Padding(
      padding: PaddingConstant.instance.buttonPadding,
      child: GeneralButton(function: () {}, text: "Güncelle"),
    );
  }

  Padding profilePhoneTextField() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          obscureText: true,
          controller: profilePhoneController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.profilePhone,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
        ),
      ),
    );
  }

  Padding profilePhoneText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            StringConstant.instance.profilePhoneText,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
      ),
    );
  }

  Padding profileEmailTextField(String? email) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: profileEmailController,
          decoration: InputDecoration(
            hintText: email,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
        ),
      ),
    );
  }

  Padding profileEmailText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            StringConstant.instance.formEmail,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
      ),
    );
  }

  Padding profileNameTextField(String? name) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          controller: profileNameController,
          decoration: InputDecoration(
            hintText: name,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
        ),
      ),
    );
  }

  Padding profileNameText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            StringConstant.instance.formregisterName,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
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
