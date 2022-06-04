// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/utils/show_toast_message.dart';
import 'package:why_not_143_team/meta/model/shelter_model.dart';
import 'package:why_not_143_team/meta/widget/coming_soon_widget.dart';
import 'package:why_not_143_team/meta/widget/sub_text_widget.dart';
import 'package:why_not_143_team/meta/widget/title_widget.dart';

class ShelterPage extends StatefulWidget {
  final Shelters shelters;
  const ShelterPage({Key? key, required this.shelters}) : super(key: key);

  @override
  State<ShelterPage> createState() => _ShelterPageState();
}

class _ShelterPageState extends State<ShelterPage> {
  Future<void> _copyToClipboard() async {
    showToast(context, StringConstant.instance.copyIban);
    await Clipboard.setData(ClipboardData(text: widget.shelters.iBAN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _shelterAppBar(),
        body: Padding(
          padding: PaddingConstant.instance.genelPadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _donateImage(),
                EmptyBox.instance.emptyBoxSmall,
                _donateDetails(),
                EmptyBox.instance.emptyBoxNormal,
                _donateButton()
              ],
            ),
          ),
        ));
  }

  AppBar _shelterAppBar() {
    return AppBar(
        title: Text(
      StringConstant.instance.donate,
      style: GoogleFonts.poppins(
        color: ColorConstant.instance.yankeBlue,
      ),
    ));
  }

  Widget ibanContainer(Future<void> Function() _copyToClipboard) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
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
    );
  }

  Widget _donateImage() {
    return widget.shelters.photo == null
        ? const Center(child: Text("Bulunamadı"))
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200.h,
            child: CachedNetworkImage(
              imageUrl: widget.shelters.photo!,
              fit: BoxFit.cover,
            ));
  }

  Widget _donateDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.shelters.name == null
            ? const Text("N/a")
            : Text(
                widget.shelters.name!,
                style: TextStyleConstant.instance.title1
                    .copyWith(color: ColorConstant.instance.yankeBlue),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: ColorConstant.instance.orange.withOpacity(0.5),
            ),
            widget.shelters.location == null
                ? const Text("N/a")
                : Flexible(
                    child: Text(
                      widget.shelters.location!,
                      style: TextStyleConstant.instance.textLargeMedium,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                    ),
                  ),
          ],
        ),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TittleWidget(text: "Geçmişi"),
            Divider(
              endIndent: 280.h,
            ),
            SubText(text: widget.shelters.history!),
            SizedBox(
              height: 30.h,
            ),
            ibanContainer(_copyToClipboard),
          ],
        ),
      ],
    );
  }

  Widget _donateButton() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          height: 58.h,
          width: MediaQuery.of(context).size.height,
          child: ElevatedButton(
            onPressed: () async {
              showToast(context, StringConstant.instance.commingSoonMess);
            },
            child: Text(
              StringConstant.instance.donate,
              style: TextStyleConstant.instance.textLargeRegular,
            ),
            style: ButtonStyleConstant.instance.genelButtonStyle,
          ),
        ),
        ComingSoonWidget(),
      ],
    );
  }
}
