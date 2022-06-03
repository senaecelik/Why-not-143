import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
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
        child: Padding(
          padding: PaddingConstant.instance.genelPadding,
          child: Column(
            children: [
              FormText(text: StringConstant.instance.formEmail),
              EmptyBox.instance.emptyBoxSmall,
              emailTextFormField(context, emailController, viewModel),
              EmptyBox.instance.emptyBoxSmall,
              FormText(text: StringConstant.instance.formPassword),
              EmptyBox.instance.emptyBoxSmall,
              passTextField(context, passwordController, viewModel),
              forgotPassTextButton(context),
              EmptyBox.instance.emptyBoxSmall,
              viewModel.isBusy
                  ? const CustomCircular()
                  : _loginButton(_formKey, viewModel, context, emailController,
                      passwordController),
            ],
          ),
        ));
  }

  Widget emailTextFormField(context, emailController, viewModel) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: InputDecoration(
          hintText: StringConstant.instance.formEmail,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
        validator: (value) {
          return viewModel.emailValidatorMethod(value);
        },
      ),
    );
  }

  Widget _loginButton(
      _formKey, viewModel, context, emailController, passwordController) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              viewModel.logInUser(context, emailController, passwordController);
            }
          },
          child: Text(
            StringConstant.instance.loginSignIn,
            style: TextStyleConstant.instance.textLargeRegular,
          ),
          style: ButtonStyleConstant.instance.genelButtonStyle),
    );
  }

  Widget passTextField(context, passwordController, viewModel) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: TextFormField(
        obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
          hintText: StringConstant.instance.formTextFieldPassword,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
        validator: (value) {
          return viewModel.passwordValidation(value);
        },
      ),
    );
  }

  Widget forgotPassTextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstant.forgotPassRoute);
        },
        child: Text(StringConstant.instance.formForgotPass,
            style: TextStyleConstant.instance.verySmallMedium
                .copyWith(color: ColorConstant.instance.primary700)),
      ),
    );
  }
}
