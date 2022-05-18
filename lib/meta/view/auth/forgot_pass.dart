import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/widget/general_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void resetPassword() async {
    context
        .read<FirebaseAuthMethods>()
        .resetPassword(emailController.text, context);
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
            labelText(),
            emailText(),
            emailTextField(emailController),
            Padding(
              padding: PaddingConstant.instance.loginPadding,
              child: GeneralButton(
                  function: resetPassword,
                  text: StringConstant.instance.resetPass),
            )
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
            hintText: StringConstant.instance.resetPass,
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
        StringConstant.instance.loginForgotPass,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
