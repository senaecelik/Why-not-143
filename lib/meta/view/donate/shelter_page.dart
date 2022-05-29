import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/helper/utils/show_toast_message.dart';
import 'package:why_not_143_team/meta/model/shelter_model.dart';

class ShelterPage extends StatefulWidget {
  final Shelters shelters;
  const ShelterPage({Key? key, required this.shelters}) : super(key: key);

  @override
  State<ShelterPage> createState() => _ShelterPageState();
}

class _ShelterPageState extends State<ShelterPage> {
  Future<void> _copyToClipboard() async {
    showToast(context, "Iban Kopyalandı");
    await Clipboard.setData(ClipboardData(text: widget.shelters.iBAN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          StringConstant.instance.donateAppBarTitle,
          style: GoogleFonts.poppins(
            color: ColorConstant.instance.yankeBlue,
          ),
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [donateImage(), details()],
        ));
  }

  Padding ibanContainer(Future<void> Function() _copyToClipboard) {
    return Padding(
      padding: EdgeInsets.all(15.0.r),
      child: Container(
        height: 100.h,
        width: 410.w,
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
                  Text(widget.shelters.iBAN!,
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
    );
  }

  Widget donateImage() {
    return widget.shelters.photo == null
        ? const Center(child: Text("Bulunamadı"))
        : SizedBox(
            width: 200.w,
            height: 200.h,
            child: CachedNetworkImage(
              imageUrl: widget.shelters.photo!,
              fit: BoxFit.fitHeight,
            ));
  }

  Align details() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 525.h,
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
        child: Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Row(
                  children: [
                    Text(
                      widget.shelters.name!,
                      style: TextStyleConstant.instance.title1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.0.r),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: ColorConstant.instance.yankeBlue,
                    ),
                    Flexible(
                      child: Text(
                        widget.shelters.location!,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.center,
                        style: TextStyleConstant.instance.textLargeMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Text(
                          'Geçmişi',
                          style: TextStyleConstant.instance.title1,
                        ),
                      ),
                      Text(
                        widget.shelters.history!,
                        style: TextStyleConstant.instance.textLargeRegular,
                        textAlign: TextAlign.center,
                      ),
                      ibanContainer(_copyToClipboard),
                      donateButton(),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget donateButton() {
    return Padding(
        padding: EdgeInsets.all(12.0.r),
        child: SizedBox(
          height: 60.h,
          width: MediaQuery.of(context).size.height,
          child: ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, RouteConstant.homeScreenRoute);
            },
            child: Text(
              StringConstant.instance.donateAppBarTitle,
              style: TextStyleConstant.instance.textLargeMedium,
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: ColorConstant.instance.yankeBlue,
              onPrimary: ColorConstant.instance.white,
              side: BorderSide(
                  width: 1.0, color: ColorConstant.instance.yankeBlue),
            ),
          ),
        ));
  }
}
