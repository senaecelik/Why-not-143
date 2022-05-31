import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/widget/coming_soon_widget.dart';

class CardItem2 extends StatelessWidget {
  final String text;
  final String buttonText;
  const CardItem2({required this.text, required this.buttonText, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorConstant.instance.yankeBlue,
                ColorConstant.instance.bayOfMany,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.instance.yankeBlue,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.0.r, bottom: 5.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style:
                          TextStyleConstant.instance.textSmallMedium.copyWith(
                        color: ColorConstant.instance.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.r),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConstant.instance.white,
                        onPrimary: ColorConstant.instance.yankeBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {},
                      child: Text(
                        buttonText,
                        style:
                            TextStyleConstant.instance.verySmallMedium.copyWith(
                          color: ColorConstant.instance.yankeBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 15,
          child: CustomPaint(
            size: Size(90.w, 150.h),
            painter: CustomCardShapePainter(
                30,
                ColorConstant.instance.yankeBlue,
                ColorConstant.instance.bayOfMany),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 15,
          child: SizedBox(
            height: 100.h,
            width: 100.h,
            child: const ComingSoonWidget(),
          ),
        ),
      ],
    );
  }
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();

    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(-radius, 2 * radius, 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
