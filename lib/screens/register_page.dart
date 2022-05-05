import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/services/firebase_auth_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/widget/general_button.dart';

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
  void dispose() {
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerNameController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
        name: registerNameController.text,
        email: registerEmailController.text,
        password: registerPasswordController.text,
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
            nameText(),
            nameTextField(),
            emailText(),
            mailTextField(),
            passwordText(),
            passTextField(),
            GeneralButton(
                function: signUpUser,
                text: StringConstant.instance.registerSignUp)
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

  Padding loginButton() {
    return Padding(
        padding: PaddingConstant.instance.loginPadding,
        child: InkWell(
            onTap: signUpUser,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.instance.yankeBlue),
              child: Text(
                StringConstant.instance.registerSignUp,
                style: TextStyleConstant.instance.textLargeMedium
                    .copyWith(color: ColorConstant.instance.white),
                textAlign: TextAlign.center,
              ),
            )));
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
