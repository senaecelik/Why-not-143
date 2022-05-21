import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';
import 'package:why_not_143_team/meta/widget/form_text.dart';
import 'login_page_view_model.dart';

class UserLoginForm extends HookViewModelWidget<LoginViewModel> {
  const UserLoginForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            FormText(text: StringConstant.instance.formEmail),
            emailTextFormField(context, emailController, viewModel),
            FormText(text: StringConstant.instance.formPassword),
            passTextField(context, passwordController, viewModel),
            forgotPassTextButton(context),
            viewModel.isBusy
                ? const CustomCircular()
                : _loginButton(_formKey, viewModel, context, emailController,
                    passwordController),
          ],
        ));
  }

  Widget emailTextFormField(context, emailController, viewModel) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.formEmail,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
          validator: (value) {
            return viewModel.emailValidatorMethod(value);
          },
        ),
      ),
    );
  }

  Widget _loginButton(
      _formKey, viewModel, context, emailController, passwordController) {
    return Padding(
        padding: PaddingConstant.instance.genelButtonPadding,
        child: SizedBox(
          height: 58.h,
          width: MediaQuery.of(context).size.height,
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                viewModel.logInUser(
                    context, emailController, passwordController);
              }
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

  Widget passTextField(context, passwordController, viewModel) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: TextFormField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.formTextFieldPassword,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
          validator: (value) {
            return viewModel.passwordValidation(value);
          },
        ),
      ),
    );
  }

  Widget forgotPassTextButton(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: PaddingConstant.instance.textPadding,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteConstant.forgotPassRoute);
          },
          child: Text(StringConstant.instance.formForgotPass,
              style: TextStyleConstant.instance.verySmallMedium
                  .copyWith(color: ColorConstant.instance.primary700)),
        ),
      ),
    );
  }
}
