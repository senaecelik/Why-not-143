import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: PaddingConstant.instance.genelPadding,
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: ColorConstant.instance.white,
        ),
        child: CircularText(
          children: [
            TextItem(
              text: Text("Comming".toUpperCase(),
                  style: TextStyleConstant.instance.largeTitle
                      .copyWith(color: ColorConstant.instance.yankeBlue)),
              space: 20,
              startAngle: -90,
              startAngleAlignment: StartAngleAlignment.center,
              direction: CircularTextDirection.clockwise,
            ),
            TextItem(
              text: Text("Soon".toUpperCase(),
                  style: TextStyleConstant.instance.largeTitle
                      .copyWith(color: ColorConstant.instance.yankeBlue)),
              space: 20,
              startAngle: 90,
              startAngleAlignment: StartAngleAlignment.center,
              direction: CircularTextDirection.anticlockwise,
            ),
          ],
          radius: 125,
          position: CircularTextPosition.inside,
          backgroundPaint: Paint()..color = ColorConstant.instance.white,
        ));
  }
}
