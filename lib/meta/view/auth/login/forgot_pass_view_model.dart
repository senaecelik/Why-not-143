import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/core/services/firebase_auth_method.dart';

class ForgotPassViewModel extends BaseViewModel {

  void resetPassword(BuildContext context, emailController) async {
    setBusy(true);
    context
        .read<FirebaseAuthMethods>()
        .resetPassword(emailController.text, context)
        .then((value) => {setBusy(false)});
    notifyListeners();
  }

}
