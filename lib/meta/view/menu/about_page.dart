import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leadingWidth: 40,
            title: Text(StringConstant.instance.about,
                style: GoogleFonts.poppins(
                    color: ColorConstant.instance.yankeBlue)),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
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
