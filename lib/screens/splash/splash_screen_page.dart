import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/constant/asset_path.dart';
import 'package:why_not_143_team/screens/splash/splash_view_model.dart';
import 'package:why_not_143_team/widget/splash_widget.dart';
import '../../constant.dart/color_constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (context, model, child) => Center(
              child: Splash(
                backgroundColor: ColorConstant.instance.white,
                image: Image.asset(AssetPath.instance.logoPaw),
                photoSize: 75,
              ),
            ));
  }
}
