import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';

class RegisterViewModel extends BaseViewModel {
  void registerUser(BuildContext context, registerNameController,
      registerEmailController, registerPasswordController) {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
        displayName: registerNameController.text,
        email: registerEmailController.text,
        password: registerPasswordController.text,
        context: context);
    notifyListeners();
  }
}
