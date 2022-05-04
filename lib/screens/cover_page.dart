import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/widget/button_widget.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _coverPageBody(context)),
    );
  }

  Column _coverPageBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appName(),
              _animatedLogo(),
              _getStartedButton()
            ],
          ),
        )
      ],
    );
  }

  SizedBox _animatedLogo() => SizedBox(child: Lottie.asset(AssetPath.instance.coverImage));

  Flexible _getStartedButton() {
    return Flexible(
        flex: 2,
        child: BlueButtonWidget(
          text: StringConstant.instance.covetButtonText,
          page: RouteConstant.onBoardScreenRoute,
        ));
  }

  Expanded _appName() {
    return Expanded(
      flex: 2,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
              padding: PaddingConstant.instance.appNamePadding,
              child: const _TitleWidget()),
          Positioned(left: 40, child: Image.asset(AssetPath.instance.appLogo)),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConstant.instance.coverTitle,
      style: TextStyleConstant.instance.largeTitle
          .copyWith(color: ColorConstant.instance.yankeBlue),
    );
  }
}
