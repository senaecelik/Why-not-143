import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/view/auth/register/register_page_view_model.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';
import 'package:why_not_143_team/meta/widget/form_text.dart';

class UserRegisterForm extends HookViewModelWidget<RegisterViewModel> {
  const UserRegisterForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final registerEmailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            FormText(text: StringConstant.instance.formregisterName),
            nameTextField(context, nameController, viewModel),
            FormText(text: StringConstant.instance.formEmail),
            mailTextField(context, registerEmailController, viewModel),
            FormText(text: StringConstant.instance.formPassword),
            passTextField(context, passwordController, viewModel),
            viewModel.isBusy
                ? const CustomCircular()
                : signupButton(
                    _formKey,
                    viewModel,
                    context,
                    nameController,
                    registerEmailController,
                    passwordController,
                  )
          ],
        ));
  }

  Padding phoneTextField(context, registerPhoneController, viewModel) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: TextFormField(
          controller: registerPhoneController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.formTextFieldPhone,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
          validator: (value) {
            viewModel.emptyValidation(value);
            return null;
          },
        ),
      ),
    );
  }

  Padding passTextField(context, registerPasswordController, viewModel) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: TextFormField(
          obscureText: true,
          controller: registerPasswordController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.formTextFieldPassword,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
          validator: (value) {
            viewModel.emptyValidation(value);
            return null;
          },
        ),
      ),
    );
  }

  Padding mailTextField(
      context, registerEmailController, RegisterViewModel viewModel) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: registerEmailController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.formTextFieldMail,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
          validator: (value) {
            viewModel.emailValidatorMethod(value);
            return null;
          },
        ),
      ),
    );
  }

  Padding nameTextField(context, registerNameController, viewModel) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: SizedBox(
        height: 58.h,
        width: MediaQuery.of(context).size.height,
        child: TextFormField(
          controller: registerNameController,
          decoration: InputDecoration(
            hintText: StringConstant.instance.formregisterName,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorConstant.instance.neutral300)),
          ),
          validator: (value) {
            viewModel.emptyValidation(value);
            return null;
          },
        ),
      ),
    );
  }

  Widget signupButton(_formKey, viewModel, context, nameController,
      emailController, passwordController) {
    return Padding(
        padding: PaddingConstant.instance.genelButtonPadding,
        child: SizedBox(
          height: 58.h,
          width: MediaQuery.of(context).size.height,
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                viewModel.registerUser(context, nameController, emailController,
                    passwordController);
              }
            },
            child: Text(StringConstant.instance.registerSignUp),
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
}
