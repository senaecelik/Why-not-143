import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/view/auth/register/register_page_view_model.dart';
class UserRegisterForm extends HookViewModelWidget<RegisterViewModel> {
  const UserRegisterForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
      BuildContext context, RegisterViewModel viewModel) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
        child: Column(
      children: [
        nameText(),
        nameTextField(nameController),
        mailTextField(emailController),
        passTextField(passwordController),
        signupButton(viewModel, context, nameController, emailController,
            passwordController),
      ],
    ));
  }

  Padding passTextField(registerPasswordController) {
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

  Padding mailTextField(registerEmailController) {
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

  Padding nameTextField(registerNameController) {
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

  Widget signupButton(
      RegisterViewModel viewModel,
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController passwordController) {
    return InkWell(
      onTap: () {
        viewModel.registerUser(
            context, nameController, emailController, passwordController);
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
}
