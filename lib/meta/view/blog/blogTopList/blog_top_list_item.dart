import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/model/blog_model.dart';
import 'package:why_not_143_team/meta/widget/title_widget.dart';

class BlogTopListItem extends StatelessWidget {
  final Blogs blogs;
  const BlogTopListItem({Key? key, required this.blogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: ColorConstant.instance.white,
          borderRadius: BorderRadius.circular(20),
          elevation: 2,
          child: Padding(
            padding: PaddingConstant.instance.genelPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorConstant.instance.donate1,
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              ColorConstant.instance.black.withOpacity(0.34),
                              BlendMode.multiply),
                          image: NetworkImage(
                            blogs.photo!,
                          ),
                          fit: BoxFit.cover)),
                ),
                EmptyBox.instance.emptyBoxSmallWidth,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TittleWidget(text: blogs.blogTitle!),
                    EmptyBox.instance.emptyBoxSmall,
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          size: 16,
                          color: ColorConstant.instance.neutral,
                        ),
                        Text(
                          blogs.blogAuthor! + "  |  ",
                          style: TextStyleConstant.instance.verySmallMedium,
                        ),
                        Icon(
                          Icons.timelapse_outlined,
                          size: 16,
                          color: ColorConstant.instance.neutral,
                        ),
                        Text(
                          blogs.createdTime!,
                          style: TextStyleConstant.instance.verySmallMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        EmptyBox.instance.emptyBoxNormal
      ],
    );
  }
}
