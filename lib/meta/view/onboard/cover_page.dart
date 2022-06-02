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
    Future<bool> _onWillPop() async {
      return false; //<-- SEE HERE
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: SingleChildScrollView(child: _coverPageBody(context)),
        ),
      ),
    );
  }

  Column _coverPageBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [titleWidget(), _animatedLogo(), blueButtonWidget()],
        )
      ],
    );
  }

  Padding titleWidget() {
    return Padding(
        padding: PaddingConstant.instance.appNamePadding,
        child: const _TitleWidget());
  }

  BlueButtonWidget blueButtonWidget() {
    return BlueButtonWidget(
      text: StringConstant.instance.covetButtonText,
      page: RouteConstant.onBoardScreenRoute,
    );
  }

  SizedBox _animatedLogo() =>
      SizedBox(child: Lottie.asset(AssetPath.instance.coverImage));
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
