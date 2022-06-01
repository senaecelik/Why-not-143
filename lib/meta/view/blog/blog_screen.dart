import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/view/blog/blogList/blog_list.dart';
import 'package:why_not_143_team/meta/view/blog/blogTopList/blog_top_list.dart';
import 'package:why_not_143_team/meta/widget/title_widget.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _blogAppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _blogList(context),
            _blogOtherText(),
            _blogTopList(),
          ],
        ),
      ),
    );
  }

  Padding _blogOtherText() {
    return Padding(
      padding: PaddingConstant.instance.genelPadding,
      child: TittleWidget(text: StringConstant.instance.blogOther),
    );
  }

  SizedBox _blogTopList() {
    return SizedBox(
      height: 400.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0.r),
        child: const BlogTopList(),
      ),
    );
  }

  SizedBox _blogList(BuildContext context) {
    return SizedBox(
        height: 300.h,
        width: MediaQuery.of(context).size.width,
        child: const BlogList());
  }

  AppBar _blogAppBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.blogAppBar,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
