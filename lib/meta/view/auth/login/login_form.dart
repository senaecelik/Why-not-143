import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'login_page_view_model.dart';

class UserLoginForm extends HookViewModelWidget<LoginViewModel> {
  const UserLoginForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel viewModel) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
        child: Column(
      children: [
        emailText(),
        emailTextField(emailController),
        passwordText(),
        passTextField(passwordController),
        viewModel.isBusy
            ? const CircularProgressIndicator()
            : loginButton(
                viewModel, context, emailController, passwordController),
      ],
    ));
  }

  Widget loginButton(
      LoginViewModel viewModel,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return InkWell(
      onTap: () {
        viewModel.logInUser(context, emailController, passwordController);
      },
      child: Container(
        height: 58.h,
        width: 320.w,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstant.instance.yankeBlue),
        child: Text(
          StringConstant.instance.loginSignIn,
          style: TextStyleConstant.instance.textLargeMedium
              .copyWith(color: ColorConstant.instance.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Padding emailTextField(TextEditingController emailController) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: 328.w,
        child: TextFormField(
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

Padding passTextField(TextEditingController passwordController) {
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
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
      ),
    ),
  );
}
