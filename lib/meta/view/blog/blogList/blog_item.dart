import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/model/blog_model.dart';

class BlogListItem extends StatelessWidget {
  final Blogs blog;
  const BlogListItem({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 350.h,
        width: 250.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorConstant.instance.donate1,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    ColorConstant.instance.black.withOpacity(0.34),
                    BlendMode.multiply),
                image: NetworkImage(
                  blog.photo!,
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: PaddingConstant.instance.genelButtonPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blog.blogTitle!,
                style: TextStyleConstant.instance.textSmallMedium
                    .copyWith(color: ColorConstant.instance.white),
              ),
              Text(
                blog.blogAuthor!,
                style: TextStyleConstant.instance.textSmallMedium
                    .copyWith(color: ColorConstant.instance.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
