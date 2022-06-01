import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/constant/color_constant.dart';

class ShelterListItem extends StatelessWidget {
  final String name;
  final String city;
  const ShelterListItem({required this.name, required this.city, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.r),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstant.instance.bayOfMany,
              blurRadius: 5,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.instance.yankeBlue,
              ColorConstant.instance.bayOfMany,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            name,
            style: TextStyleConstant.instance.textLargeMedium
                .copyWith(color: ColorConstant.instance.white),
          ),
          subtitle: Text(
            city,
            style: TextStyleConstant.instance.textLargeMedium
                .copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
