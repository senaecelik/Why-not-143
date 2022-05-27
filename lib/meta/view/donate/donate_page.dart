import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/view/donate/shelter_list.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            ShelterList(),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.shelterTitle,
        style: GoogleFonts.poppins(
          color: ColorConstant.instance.yankeBlue,
        ),
      ),
    );
  }
}
