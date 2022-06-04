import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/helper/utils/show_toast_message.dart';
import 'package:why_not_143_team/meta/model/pet_model.dart';
import 'package:why_not_143_team/meta/widget/coming_soon_widget.dart';
import 'package:why_not_143_team/meta/widget/sub_text_widget.dart';

class DetailPage extends StatefulWidget {
  final Pets pet;
  const DetailPage({Key? key, required this.pet}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Pets> favPet = [];
  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User?>();
    return Scaffold(
        appBar: appBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: PaddingConstant.instance.genelPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _petImage(),
                  EmptyBox.instance.emptyBoxBig,
                  _details(_firebaseUser, context),
                  EmptyBox.instance.emptyBoxLarge,
                  _adoptPetButton(_firebaseUser, context),
                  EmptyBox.instance.emptyBoxNormal,
                  _beFamilyButton(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _beFamilyButton(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          height: 58.h,
          width: MediaQuery.of(context).size.height,
          child: ElevatedButton(
              onPressed: () {
                showToast(context, StringConstant.instance.commingSoonMess);
              },
              child: Text(
                StringConstant.instance.beFamily,
                style: TextStyleConstant.instance.textLargeMedium,
              ),
              style: ButtonStyleConstant.instance.genelButtonStyle),
        ),
        const ComingSoonWidget()
      ],
    );
  }

  Widget _details(User? _firebaseUser, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.pet.name!,
              style: TextStyleConstant.instance.title1
                  .copyWith(color: ColorConstant.instance.yankeBlue),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: ColorConstant.instance.orange.withOpacity(0.5),
            ),
            Text(
              widget.pet.location!,
              style: TextStyleConstant.instance.textLargeMedium,
            ),
          ],
        ),
        const Divider(),
        _petAttribute(),
        SizedBox(
          height: 10.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Geçmiş",
                  style: TextStyleConstant.instance.title1
                      .copyWith(color: ColorConstant.instance.yankeBlue),
                ),
              ],
            ),
            const Divider(),
            SubText(text: widget.pet.history!)
          ],
        ),
      ],
    );
  }

  Row _petAttribute() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 55.h,
          width: 105.w,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              widget.pet.gender!,
              style: TextStyleConstant.instance.textLargeRegular,
            ),
          ),
        ),
        Container(
          height: 55.h,
          width: 105.w,
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              widget.pet.age!,
              style: TextStyleConstant.instance.textLargeRegular,
            ),
          ),
        ),
        Container(
          height: 55.h,
          width: 105.w,
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              widget.pet.type!,
              style: TextStyleConstant.instance.textLargeRegular,
            ),
          ),
        ),
      ],
    );
  }

  Widget _petImage() {
    return widget.pet.photo == null
        ? const Center(child: Text("Bulunamadı"))
        : Hero(
            tag: "pet-image",
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                child: CachedNetworkImage(
                  imageUrl: widget.pet.photo!,
                  fit: BoxFit.contain,
                )),
          );
  }

  Widget _adoptPetButton(User? _firebaseUser, BuildContext context) {
    return SizedBox(
      height: 58.h,
      width: MediaQuery.of(context).size.height,
      child: ElevatedButton(
          onPressed: () async {
            if (!_firebaseUser!.isAnonymous) {
              Navigator.pushNamed(context, RouteConstant.formScreenRoute);
            } else {
              showToast(context, StringConstant.instance.loginMess);

              Navigator.pushNamed(context, RouteConstant.loginScreenRoute);
            }
          },
          child: Text(
            StringConstant.instance.adoptPet,
            style: TextStyleConstant.instance.textLargeMedium,
          ),
          style: ButtonStyleConstant.instance.genelButtonStyle),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        StringConstant.instance.detail,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }

  void adoptForm() {
    Navigator.pushNamed(context, RouteConstant.formScreenRoute);
  }
}
