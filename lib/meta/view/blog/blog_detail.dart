import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/model/blog_model.dart';
import 'package:why_not_143_team/meta/widget/sub_text_widget.dart';
import 'package:why_not_143_team/meta/widget/title_widget.dart';

class BlogDetailPage extends StatefulWidget {
  final Blogs blog;
  const BlogDetailPage({Key? key, required this.blog}) : super(key: key);

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          StringConstant.instance.blogAppBar,
          style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        ColorConstant.instance.black.withOpacity(0.34),
                        BlendMode.multiply),
                    image: NetworkImage(
                      widget.blog.photo!,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: PaddingConstant.instance.genelPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.blog.blogTitle!,
                      style: TextStyleConstant.instance.title1
                          .copyWith(color: ColorConstant.instance.white),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.blog.createdTime! + " | ",
                          style: TextStyleConstant.instance.textLargeMedium
                              .copyWith(color: ColorConstant.instance.white),
                        ),
                        Text(
                          widget.blog.blogAuthor!,
                          style: TextStyleConstant.instance.textLargeMedium
                              .copyWith(color: ColorConstant.instance.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: PaddingConstant.instance.genelPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TittleWidget(text: widget.blog.blogTitle!),
                  SubText(text: widget.blog.blog!)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
