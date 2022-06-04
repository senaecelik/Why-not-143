import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class GeneralButton extends StatelessWidget {
  final Function() function;
  final String text;
  const GeneralButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
          height: 58.h,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.instance.yankeBlue),
          child: Padding(
            padding: EdgeInsets.all(1.0.r),
            child: Text(
              text,
              style: TextStyleConstant.instance.textSmallMedium
                  .copyWith(color: ColorConstant.instance.white),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
