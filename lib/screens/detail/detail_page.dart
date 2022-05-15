import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
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
        appBar: appBar(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              petImage(),
              details(),
              sahiplenButton(_firebaseUser, context),
              const SizedBox(
                height: 20,
              ),
              koruyucuAileButton(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  GeneralButton koruyucuAileButton() =>
      GeneralButton(function: adoptForm, text: "Koruyucu ailesi ol");

  InkWell sahiplenButton(User? _firebaseUser, BuildContext context) {
    return InkWell(
        onTap: () {
          _firebaseUser != null
              ? Navigator.pushNamed(context, RouteConstant.formScreenRoute)
              : showToast(context, "Lütfen giriş yapın");
          Navigator.pushNamed(context, RouteConstant.loginScreenRoute);
        },
        child: Container(
          height: 58.h,
          width: 327.w,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.instance.yankeBlue),
          child: Text(
            "Sahiplen",
            style: TextStyleConstant.instance.textLargeMedium
                .copyWith(color: ColorConstant.instance.white),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Align details() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 350.h,
        width: 400.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset(0, -4),
                  blurRadius: 8)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.r,
                left: 20.r,
                right: 20.r,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Çiko',
                      style: TextStyleConstant.instance.title1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.r,
                left: 40.r,
                right: 30.r,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: ColorConstant.instance.yankeBlue,
                  ),
                  Text(
                    'Ankara, Türkiye',
                    style: TextStyleConstant.instance.textLargeMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        height: 88.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Erkek',
                            style: TextStyleConstant.instance.textLargeRegular,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        height: 88.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            '1 Yaş',
                            style: TextStyleConstant.instance.textLargeRegular,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Container(
                        height: 88.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            '10 Kg',
                            style: TextStyleConstant.instance.textLargeRegular,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Text(
                                'Geçmişi',
                                style: TextStyleConstant.instance.title1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: Text(
                                'Çiko 03/05/2012 doğumlu. Irkı Melez. Siyah-kahverengi-beyaz renkte. Seninle tanışmak için sabırsızlanıyor.Haydi Formu Doldur',
                                style:
                                    TextStyleConstant.instance.textLargeRegular,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding petImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: Container(
        width: 200.w,
        height: 200.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.instance.cat1),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leadingWidth: 80,
      title: Text(
        "Detay Sayfası",
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }

  void adoptForm() {
    Navigator.pushNamed(context, RouteConstant.formScreenRoute);
  }
}
