import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';

import '../helper/constant/text_style.dart';

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