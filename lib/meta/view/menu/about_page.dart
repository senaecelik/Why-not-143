import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/widget/sub_text_widget.dart';
import 'package:why_not_143_team/meta/widget/title_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(StringConstant.instance.about,
                style: GoogleFonts.poppins(
                    color: ColorConstant.instance.yankeBlue)),
          ),
          body: SafeArea(
            child: Padding(
              padding: PaddingConstant.instance.genelPadding,
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




