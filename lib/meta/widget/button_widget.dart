import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class BlueButtonWidget extends StatelessWidget {
  final String text;
  final String page;
  const BlueButtonWidget({Key? key, required this.text, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, page);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstant.instance.yankeBlue),
        child: Text(
          text,
          style: TextStyleConstant.instance.textLargeMedium
              .copyWith(color: ColorConstant.instance.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
