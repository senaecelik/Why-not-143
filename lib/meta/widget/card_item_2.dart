// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/widget/coming_soon_widget.dart';

class CardItem2 extends StatelessWidget {
  final String text;
  final String buttonText;
  const CardItem2({required this.text, required this.buttonText, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerRight, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.3, 1],
              colors: [ColorConstant.instance.yankeBlue, Colors.blueGrey]),
        ),
        child: Padding(
          padding: PaddingConstant.instance.genelButtonPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text,
                  style: TextStyleConstant.instance.textLargeMedium
                      .copyWith(color: ColorConstant.instance.white)),
              Row(
                children: [
                  SizedBox(
                    width: 100.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(buttonText),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        primary: ColorConstant.instance.white,
                        onPrimary: ColorConstant.instance.yankeBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ComingSoonWidget()
    ]);
  }
}
