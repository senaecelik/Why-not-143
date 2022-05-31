import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/widget/carousel_slider_widget.dart';
import 'package:why_not_143_team/meta/view/home/cat_list.dart';
import 'package:why_not_143_team/meta/view/home/dog_list.dart';
import 'package:why_not_143_team/meta/view/home/pet_list.dart';

class HomePage extends StatefulWidget {
  final ZoomDrawerController drawerController;
  const HomePage(this.drawerController, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: DefaultTabController(
          length: 3,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EmptyBox.instance.emptyBoxNormal,
                const CardSlider(),
                EmptyBox.instance.emptyBoxSmall,
                _homePageBodySection(),
              ],
            ),
          ),
        ));
  }

  Widget _homePageBodySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HomeTabBar(context),
        SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: homeTabBarView(context)),
      ],
    );
  }

  Widget homeTabBarView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.r, bottom: 220.r),
      child: TabBarView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 50.0.r),
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 70.0.r),
                  child: const PetList(),
                )),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const CatList()),
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const DogList()),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  Widget HomeTabBar(BuildContext context) {
    return SizedBox(
        height: 50.h,
        width: 260.w,
        child: Padding(
          padding: EdgeInsets.only(
              top: 2.0.r, bottom: 2.0.r, left: 20.r, right: 2.r),
          child: TabBar(
            unselectedLabelColor: ColorConstant.instance.yankeBlue,
            unselectedLabelStyle: TextStyleConstant.instance.textSmallMedium,
            labelStyle: TextStyleConstant.instance.textSmallMedium
                .copyWith(color: ColorConstant.instance.yankeBlue),
            indicatorColor: ColorConstant.instance.orange,
            labelColor: ColorConstant.instance.orange,
            tabs: [
              Tab(
                text: StringConstant.instance.homeAllPet,
              ),
              Tab(
                text: StringConstant.instance.homeCat,
              ),
              Tab(
                text: StringConstant.instance.homeDog,
              ),
            ],
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      leading: InkWell(
          onTap: () => widget.drawerController.toggle!(),
          child: const Icon(Icons.menu)),
      title: Text(
        StringConstant.instance.homePage,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }
}
