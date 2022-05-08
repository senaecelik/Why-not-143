import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

import '../../constant.dart/color_constant.dart';
import '../../constant.dart/string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leadingWidth: 80,
            title: Text(StringConstant.instance.about,
                style: GoogleFonts.poppins(
                    color: ColorConstant.instance.yankeBlue)),
          ),
          body: SafeArea(
            child: Padding(
              padding: PaddingConstant.instance.loginPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TittleWidget(text: StringConstant.instance.aboutUs),
                  SubText(text: StringConstant.instance.aboutText),
                  const Divider(),
                  TittleWidget(text: StringConstant.instance.contactUs),
                  SubText(text: StringConstant.instance.contactText),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(StringConstant.instance.emailUs)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class TittleWidget extends StatelessWidget {
  final String text;
  const TittleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleConstant.instance.textLargeMedium
          .copyWith(color: ColorConstant.instance.yankeBlue),
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  const SubText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleConstant.instance.textSmallMedium
          .copyWith(color: ColorConstant.instance.neutral),
    );
  }
}
