import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';

class LoginViewModel extends BaseViewModel {
  void logInUser(BuildContext context, emailController, passwordController) {
    setBusy(true);
    context.read<FirebaseAuthMethods>()
        .loginWithEmail(
            email: emailController.text,
            password: passwordController.text,
            context: context)
        .then((value) => {setBusy(false)});
    notifyListeners();
  }

  void resetPassword(context, emailController) async {
    setBusy(true);
    context
        .read<FirebaseAuthMethods>()
        .resetPassword(emailController.text, context)
        .then((value) => {setBusy(false)});
    notifyListeners();
  }

  String? emailValidatorMethod(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen, boş bırakmayın';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return 'Geçerli bir email adresi giriniz';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen, boş bırakmayın';
    }
    return null;
  }
}
