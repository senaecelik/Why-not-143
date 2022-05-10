import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/route/route_constant.dart';
import 'package:why_not_143_team/utils/show_toast_message.dart';
import 'package:why_not_143_team/widget/general_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          title: Text(
            "Detay Sayfası",
            style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: PaddingConstant.instance.loginPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      _firebaseUser != null
                          ? Navigator.pushNamed(
                              context, RouteConstant.formScreenRoute)
                          : showToast(context, "Lütfen giriş yapın");
                      Navigator.pushNamed(
                          context, RouteConstant.loginScreenRoute);
                    },
                    child: Container(
                      height: 58.h,
                      width: 327.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConstant.instance.yankeBlue),
                      child: Text(
                        "Sahiplen",
                        style: TextStyleConstant.instance.textLargeMedium
                            .copyWith(color: ColorConstant.instance.white),
                        textAlign: TextAlign.center,
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                GeneralButton(function: adoptForm, text: "Koruyucu ailesi ol"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }

  void adoptForm() {
    Navigator.pushNamed(context, RouteConstant.formScreenRoute);
  }
}
