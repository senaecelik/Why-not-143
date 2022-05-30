import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/view/onboard/cover_page.dart';

class SplashViewModel extends BaseViewModel {
  init(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CoverPage()));
    });
  }
}
