import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
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
        child: Padding(
          padding: PaddingConstant.instance.genelPadding,
          child: Column(
            children: [
              FormText(text: StringConstant.instance.formregisterName),
              EmptyBox.instance.emptyBoxSmall,
              nameTextField(context, nameController, viewModel),
              EmptyBox.instance.emptyBoxSmall,
              FormText(text: StringConstant.instance.formEmail),
              EmptyBox.instance.emptyBoxSmall,
              mailTextField(context, registerEmailController, viewModel),
              EmptyBox.instance.emptyBoxSmall,
              FormText(text: StringConstant.instance.formPassword),
              EmptyBox.instance.emptyBoxSmall,
              passTextField(context, passwordController, viewModel),
              EmptyBox.instance.emptyBoxBig,
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
          ),
        ));
  }

  Widget passTextField(context, registerPasswordController, viewModel) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: TextFormField(
        obscureText: true,
        controller: registerPasswordController,
        decoration: InputDecoration(
          hintText: StringConstant.instance.formTextFieldPassword,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
        validator: (value) {
          return viewModel.emptyValidation(value);
        },
      ),
    );
  }

  Widget mailTextField(
      context, registerEmailController, RegisterViewModel viewModel) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: registerEmailController,
        decoration: InputDecoration(
          hintText: StringConstant.instance.formTextFieldMail,
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

  Widget nameTextField(context, registerNameController, viewModel) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: TextFormField(
        controller: registerNameController,
        decoration: InputDecoration(
          hintText: StringConstant.instance.formregisterName,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.instance.neutral300)),
        ),
        validator: (value) {
          viewModel.emptyValidation(value);
          return null;
        },
      ),
    );
  }

  Widget signupButton(_formKey, viewModel, context, nameController,
      emailController, passwordController) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            viewModel.registerUser(
                context, nameController, emailController, passwordController);
          }
        },
        child: Text(StringConstant.instance.registerSignUp),
        style: ButtonStyleConstant.instance.genelButtonStyle,
      ),
    );
  }
}
