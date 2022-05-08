
import 'package:flutter/material.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icons;
  final String page;
  const MenuItem(
      {Key? key, required this.text, required this.icons, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, page);
      },
      child: Row(
        children: [
          Icon(
            icons,
            color: ColorConstant.instance.yankeBlue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyleConstant.instance.textLargeRegular,
            ),
          ),
        ],
      ),
    );
  }
}
