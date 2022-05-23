import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/widget/button_widget.dart';

class CoverPage extends StatefulWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: _coverPageBody(context)),
      ),
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
            children: [_appName(), _animatedLogo(), _getStartedButton()],
          ),
        )
      ],
    );
  }

  SizedBox _animatedLogo() =>
      SizedBox(child: Lottie.asset(AssetPath.instance.coverImage));

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
      flex: 1,
      child: Padding(
          padding: PaddingConstant.instance.appNamePadding,
          child: const _TitleWidget()),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(StringConstant.instance.coverTitle,
        style: TextStyle(
            fontFamily: 'Pacifico',
            color: ColorConstant.instance.yankeBlue,
            fontSize: 48.sp));
  }
}
