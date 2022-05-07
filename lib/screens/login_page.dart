import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/services/firebase_auth_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/widget/general_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void anonymously() {
    context.read<FirebaseAuthMethods>().anonymously(context);
  }

  void logInUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

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
            GeneralButton(
                function: logInUser, text: StringConstant.instance.loginSignIn),
            dontHaveAccYet(context),
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

  Widget dontHaveAccYet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConstant.instance.loginSignUp,
            style: TextStyleConstant.instance.loginVerySmallMedium,
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteConstant.registerScreenRoute);
            },
            child: Text(
              StringConstant.instance.registerSignUp,
              style: TextStyleConstant.instance.loginVerySmallMedium,
            ),
          )
        ],
      ),
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
          onPressed: () {
            context.read<FirebaseAuthMethods>().signInWithGoogle(context);
          },
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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
}
