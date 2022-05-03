
import 'package:flutter/material.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

import '../constant.dart/padding_constant.dart';

class GeneralButton extends StatelessWidget {
  final Function() function;
  final String text;
  const GeneralButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: PaddingConstant.instance.loginPadding,
        child: InkWell(
            onTap: function,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.instance.yankeBlue),
              child: Text(
                text,
                style: TextStyleConstant.instance.textLargeMedium
                    .copyWith(color: ColorConstant.instance.white),
                textAlign: TextAlign.center,
              ),
            )));
  }
}
