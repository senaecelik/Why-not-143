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
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/widget/general_button.dart';

import '../../../core/services/firebase_auth_method.dart';

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
    var name = _firebaseUser?.displayName;
    var email = _firebaseUser?.email;
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Padding(
          padding: PaddingConstant.instance.genelPadding,
          child: Column(
            children: [
              if (_firebaseUser != null)
                SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: _firebaseUser.photoURL != null
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage("${_firebaseUser.photoURL}"),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage(AssetPath.instance.menuPerson),
                        ),
                )
              else
                DrawerHeader(
                  child: SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(AssetPath.instance.menuPerson),
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
              _profileNameText(),
              SizedBox(
                height: 10.h,
              ),
              _profileNameTextField(_firebaseUser, name),
              SizedBox(
                height: 10.h,
              ),
              _profileEmailText(),
              SizedBox(
                height: 10.h,
              ),
              _profileEmailTextField(email),
              SizedBox(
                height: 20.h,
              ),
              _logOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _logOutButton(BuildContext context) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.width,
      child: GeneralButton(
          function: () {
            context.read<FirebaseAuthMethods>().signOut(context).then((value) =>
                Navigator.pushReplacementNamed(
                    context, RouteConstant.homeScreenRoute));
          },
          text: StringConstant.instance.logOut),
    );
  }

  Widget _profileNameTextField(User? _firebaseUser, String? name) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        readOnly: true,
        controller: profileNameController,
        decoration: InputDecoration(
          hintText: _firebaseUser?.displayName == null
              ? name = "Misafir"
              : name = _firebaseUser?.displayName,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
      ),
    );
  }

  Widget _profileEmailTextField(String? email) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        readOnly: true,
        keyboardType: TextInputType.emailAddress,
        controller: profileEmailController,
        decoration: InputDecoration(
          hintText: email,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
      ),
    );
  }

  Widget _profileEmailText() {
    return Row(
      children: [
        Text(
          StringConstant.instance.formEmail,
          style: TextStyleConstant.instance.textSmallMedium,
        ),
      ],
    );
  }

  Widget _profileNameText() {
    return Row(
      children: [
        Text(
          StringConstant.instance.formregisterName,
          style: TextStyleConstant.instance.textSmallMedium,
        ),
      ],
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
