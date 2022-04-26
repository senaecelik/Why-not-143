import 'package:flutter/material.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

import '../constant.dart/color_constant.dart';


class BlueButtonWidget extends StatelessWidget {
  final String text;
   const BlueButtonWidget({
    Key? key, required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.instance.yankeBlue),
      child: Text(
        text,
        style: TextStyleConstant.instance.textLargeMedium
            .copyWith(color: ColorConstant.instance.white),
      ),
    );
  }
}
