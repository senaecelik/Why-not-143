import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';

class PetListItem extends StatelessWidget {
  final String name;
  final String cins;
  final String photo;
  const PetListItem(
      {required this.name, required this.cins, required this.photo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.r, right: 5.r),
          child: Card(
            elevation: 5,
            color: ColorConstant.instance.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    width: 150.w,
                    child: CachedNetworkImage(
                      imageUrl: photo,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyleConstant.instance.textLargeMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(cins,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyleConstant.instance.textSmallRegular),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
