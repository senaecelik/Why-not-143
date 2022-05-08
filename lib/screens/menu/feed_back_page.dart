import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/screens/menu/about_page.dart';
import 'package:why_not_143_team/widget/general_button.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  String feedbackTitle = '';
  String feedbackMessage = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leadingWidth: 80,
            title: Text(StringConstant.instance.feedBack,
                style: GoogleFonts.poppins(
                    color: ColorConstant.instance.yankeBlue))),
        body: Padding(
          padding: PaddingConstant.instance.loginPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              SubText(text: StringConstant.instance.feedBackSub),
              SizedBox(height: 35.h),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TittleWidget(text: StringConstant.instance.feedBackCaption),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          feedbackTitle = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: StringConstant.instance.feedBackCaptionSub,
                        hintStyle: TextStyleConstant.instance.textSmallMedium
                            .copyWith(color: ColorConstant.instance.neutral),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          feedbackMessage = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: StringConstant.instance.feedBackMessage,
                        hintStyle: TextStyleConstant.instance.textSmallMedium
                            .copyWith(color: ColorConstant.instance.neutral),
                      ),
                    ),
                    Center(
                      child: GeneralButton(
                        text: StringConstant.instance.feedBackSend,
                        function: send,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void send() {
    Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
  }
}
