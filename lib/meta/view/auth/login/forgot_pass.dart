import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/view/auth/login/login_page_view_model.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';
import 'package:why_not_143_team/meta/widget/form_text.dart';

class ForgotPassword extends HookViewModelWidget<LoginViewModel> {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel viewModel) {
    final emailController = TextEditingController();
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            labelText(),
            _emailTextField(emailController),
            FormText(text: StringConstant.instance.formEmail),
            viewModel.isBusy
                ? const CustomCircular()
                : _forgotPassButton(context, viewModel, emailController),
          ],
        ),
      ),
    );
  }

  Padding _forgotPassButton(BuildContext context, LoginViewModel viewModel,
      TextEditingController emailController) {
    return Padding(
        padding: PaddingConstant.instance.loginPadding,
        child: SizedBox(
          height: 58.h,
          width: MediaQuery.of(context).size.height,
          child: ElevatedButton(
            onPressed: () async {
              viewModel.resetPassword(context, emailController);
            },
            child: Text(StringConstant.instance.loginSignIn),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: ColorConstant.instance.yankeBlue,
              onPrimary: ColorConstant.instance.white,
              side: BorderSide(
                  width: 1.0, color: ColorConstant.instance.yankeBlue),
            ),
          ),
        ));
  }

  Padding _emailTextField(TextEditingController emailController) {
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

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.formForgotPass,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}