import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/view/blog/blog_list.dart';
import 'package:why_not_143_team/meta/view/blog/blog_top_list.dart';
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
      appBar: AppBar(
        title: Text(
          "Pati Rehber",
          style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstant.instance.genelPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 300.h,
                  width: MediaQuery.of(context).size.width,
                  child: const BlogList()),
              EmptyBox.instance.emptyBoxNormal,
              const TittleWidget(text: "Diğer yazılar"),
              const BlogTopList(),
            ],
          ),
        ),
      ),
    );
  }
}
