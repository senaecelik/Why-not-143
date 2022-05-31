import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/core/services/firebase/firebase_auth_method.dart';

class RegisterViewModel extends BaseViewModel {
  void registerUser(BuildContext context
     ,
      registerNameController,
      registerEmailController,
      registerPasswordController,) {
    setBusy(true);
    context.read<FirebaseAuthMethods>()
        .signUpWithEmail(
            displayName: registerNameController.text,
            email: registerEmailController.text,
            password: registerPasswordController.text,
            context: context)
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

  String? emptyValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen, boş bırakmayın';
    }
    return null;
  }
}
