import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/screens/on_board_page.dart';
import '../widget/button_widget.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetPath.instance.coverImage),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: const _TitleWidget()),
                      Positioned(
                          left: 40,
                          child: Image.asset(AssetPath.instance.appLogo)),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: BlueButtonWidget(
                      text: StringConstant.instance.covetButtonText,
                      page: const OnBoard(),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConstant.instance.coverSubTitle,
      style: TextStyleConstant.instance.title2,
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
