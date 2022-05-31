import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/view/splash/splash_view_model.dart';
import 'package:why_not_143_team/meta/widget/splash_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


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
