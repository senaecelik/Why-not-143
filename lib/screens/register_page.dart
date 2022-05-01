import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/screens/home_page.dart';
import 'package:why_not_143_team/screens/register_page.dart';
import 'package:why_not_143_team/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            nameText(),
            nameTextField(),
            emailText(),
            mailTextField(),
            passwordText(),
            passTextField(),
            blueButton(),
          ],
        ),
      ),
    );
  }

  Padding passTextField() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          obscureText: true,
          controller: registerPasswordController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.loginTextFieldPassword,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
        ),
      ),
    );
  }

  Padding mailTextField() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: registerEmailController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.loginTextFieldMail,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
        ),
      ),
    );
  }

  Padding nameTextField() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          controller: registerNameController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.registerName,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
        ),
      ),
    );
  }

  Padding blueButton() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 327.w,
        child: BlueButtonWidget(
            text: StringConstant.instance.registerSignUp,
            page: RouteConstant.homeScreenRoute),
      ),
    );
  }

  Padding passwordText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            StringConstant.instance.loginPassword,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
      ),
    );
  }

  Padding emailText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            StringConstant.instance.loginEmail,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
      ),
    );
  }

  Padding nameText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            StringConstant.instance.registerName,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.registerSignUp,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
