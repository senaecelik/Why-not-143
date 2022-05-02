import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';

import '../constant.dart/padding_constant.dart';
import '../constant.dart/text_style.dart';
import '../route/route_constant.dart';
import '../widget/button_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            labelText(),
            emailText(),
            emailTextField(emailController),
            blueButtonWidget(),
          ],
        ),
      ),
    );
  }

  Padding labelText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Text(
        StringConstant.instance.forgotPassLabel,
        textAlign: TextAlign.center,
        style: TextStyleConstant.instance.textSmallRegular
            .copyWith(color: ColorConstant.instance.neutral),
      ),
    );
  }

  Padding emailText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Text(
        StringConstant.instance.loginEmail,
        style: TextStyleConstant.instance.textSmallMedium,
      ),
    );
  }

  Padding emailTextField(TextEditingController emailController) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
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

  Padding blueButtonWidget() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 327.w,
        child: BlueButtonWidget(
            text: StringConstant.instance.resetPass,
            page: RouteConstant.homeScreenRoute),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.loginForgotPass,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
