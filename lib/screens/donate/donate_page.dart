import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/utils/show_toast_message.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _copyToClipboard() async {
      showToast(context, "Iban Kopyalandı");
      await Clipboard.setData(
          ClipboardData(text: StringConstant.instance.donateIban2));
    }

    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            donateImage(),
            coverText(),
            donateText(),
            ibanContainer(_copyToClipboard),
            addressContainter(),
          ],
        ),
      ),
    );
  }

  Flexible addressContainter() {
    return Flexible(
      child: Container(
        height: 102.h,
        width: 324.w,
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstant.instance.donate2),
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.instance.donate1,
        ),
        child: Center(
          child: Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  StringConstant.instance.donateAdress,
                  style: TextStyleConstant.instance.textSmallMedium,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(StringConstant.instance.donateAdress2,
                      style: TextStyleConstant.instance.textSmallRegular),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding ibanContainer(Future<void> _copyToClipboard()) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Flexible(
        child: Container(
          height: 100.h,
          width: 324.w,
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstant.instance.donate2),
            borderRadius: BorderRadius.circular(10),
            color: ColorConstant.instance.donate1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      StringConstant.instance.donateIban,
                      style: TextStyleConstant.instance.textSmallMedium,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(StringConstant.instance.donateIban2,
                        style: TextStyleConstant.instance.textSmallRegular),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy, size: 15),
                          onPressed: _copyToClipboard,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding donateText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        StringConstant.instance.donateText,
        style: TextStyleConstant.instance.textLargeMedium,
        textAlign: TextAlign.center,
      ),
    );
  }

  Text coverText() {
    return Text(
      StringConstant.instance.donateShelter,
      style: TextStyleConstant.instance.largeTitle,
    );
  }

  SizedBox donateImage() {
    return SizedBox(
      height: 150.h,
      width: 150.w,
      child: Image.asset(AssetPath.instance.donate),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.donateAppBarTitle,
        style: GoogleFonts.poppins(
          color: ColorConstant.instance.yankeBlue,
        ),
      ),
    );
  }
}
