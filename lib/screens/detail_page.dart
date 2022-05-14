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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/c_1.png'))),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            offset: Offset(0, -4),
                            blurRadius: 8)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text('Çiko',
                                  style: GoogleFonts.poppins(
                                      color: ColorConstant.instance.yankeBlue,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight
                                          .w600) /* TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ), */
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 40,
                          right: 30,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            ),
                            Text(
                              'Ankara, Türkiye',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                height: 88,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Erkek',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                height: 88,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    '1 Yaş',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Container(
                                height: 88,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    '10 Kg',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 430),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                  /* boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.07),
                              offset: Offset(0, -3),
                              blurRadius: 12)
                        ] */
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text('Geçmişi',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 14),
                                              child: Text(
                                                'Çiko 03/05/2012 doğumlu. Irkı Melez. Siyah-kahverengi-beyaz renkte. Seninle tanışmak için sabırsızlanıyor.Haydi Formu Doldur',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            /* Expanded(
                        child: Text(
                          'Geçmişi',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ) */
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
        ));
  }

  void adoptForm() {
    Navigator.pushNamed(context, RouteConstant.formScreenRoute);
  }
}
