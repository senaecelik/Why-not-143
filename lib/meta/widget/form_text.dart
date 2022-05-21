
import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class FormText extends StatelessWidget {
  final String text;
  const FormText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstant.instance.loginPadding,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
        ],
      ),
    );
  }
}