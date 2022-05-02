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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            emailText(),
            emailTextField(),
            passwordText(),
            passTextField(),
            forgotPassTextButton(),
            blueButtonWidget(),
            dontHaveAccYet(context),
            skipTextButton(context),
            loginTextOr(),
            googleButton(),
          ],
        ),
      ),
    );
  }

  Row forgotPassTextButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: PaddingConstant.instance.loginPadding,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstant.forgotPassRoute);
            },
            child: Text(
              StringConstant.instance.loginForgotPass,
              style: TextStyleConstant.instance.loginVerySmallMedium,
            ),
          ),
        ),
      ],
    );
  }

  Row skipTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: PaddingConstant.instance.loginPadding,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            child: Text(
              StringConstant.instance.dontHaveAcc,
              style: TextStyleConstant.instance.loginVerySmallMedium,
            ),
          ),
        ),
      ],
    );
  }

  Row dontHaveAccYet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: PaddingConstant.instance.loginPadding,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteConstant.registerScreenRoute);
            },
            child: Text(
              StringConstant.instance.loginSignUp,
              style: TextStyleConstant.instance.loginVerySmallMedium,
            ),
          ),
        ),
      ],
    );
  }

  Row loginTextOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: PaddingConstant.instance.loginPadding,
          child: Text(
            StringConstant.instance.loginTextOr,
            style: TextStyleConstant.instance.loginVerySmallMedium
                .copyWith(color: ColorConstant.instance.neutral),
          ),
        ),
      ],
    );
  }

  Padding googleButton() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 327.w,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Tab(
            icon: Image.asset(AssetPath.instance.loginImage),
            iconMargin: const EdgeInsets.all(30),
          ),
          label: Text(
            StringConstant.instance.loginSignInGoogle,
            style: TextStyleConstant.instance.textLargeMedium,
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: ColorConstant.instance.white,
            onPrimary: ColorConstant.instance.yankeBlue,
            side:
                BorderSide(width: 1.0, color: ColorConstant.instance.yankeBlue),
          ),
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
          controller: passwordController,
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

  Padding emailTextField() {
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

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.loginSignIn,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
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

  Padding passwordText() {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Text(
        StringConstant.instance.loginPassword,
        style: TextStyleConstant.instance.textSmallMedium,
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
            text: StringConstant.instance.loginSignIn,
            page: RouteConstant.homeScreenRoute),
      ),
    );
  }
}
