import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';

class LoginViewModel extends BaseViewModel {
  void logInUser(BuildContext context, emailController, passwordController) {
    context.read<FirebaseAuthMethods>().loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    notifyListeners();
  }
}
