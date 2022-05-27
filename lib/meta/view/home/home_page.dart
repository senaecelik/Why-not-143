
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
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
          child: Padding(
            padding: PaddingConstant.instance.homePadding,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _homeSearchTitle(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _homeSearch(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 180.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorConstant.instance.orange.withOpacity(0.5)),
                    child: Column(
                      children: const [
                        Text("Pati Forum"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  _homePageBodySection(),
                ],
              ),
            ),
          ),
        ));
  }

  Text _homeSearchTitle() {
    return Text(
      "Bir pati dostu ara",
      style: TextStyleConstant.instance.title1
          .copyWith(color: ColorConstant.instance.yankeBlue),
    );
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
      padding: EdgeInsets.only(top: 20.0.r, bottom: 220.r),
      child: TabBarView(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const PetList()),
          const SizedBox(height: 100, child: PetList()),
          const SizedBox(height: 100, child: PetList()),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  Widget HomeTabBar(BuildContext context) {
    return SizedBox(
        height: 80.h,
        width: 230.w,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 2, right: 2),
          child: TabBar(
            unselectedLabelColor: ColorConstant.instance.yankeBlue,
            unselectedLabelStyle: TextStyleConstant.instance.textSmallMedium,
            labelStyle: TextStyleConstant.instance.textSmallMedium,
            indicator: BoxDecoration(
                color: ColorConstant.instance.yankeBlue,
                borderRadius: BorderRadius.circular(20)),
            tabs: const [
              Tab(
                text: "Tümü",
              ),
              Tab(
                text: "Kedi",
              ),
              Tab(
                text: "Köpek",
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

  Widget _homeSearch() {
    return SizedBox(
      height: 40.h,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 15),
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstant.instance.neutral300,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.instance.neutral),
                borderRadius: BorderRadius.circular(20)),
            hintText: StringConstant.instance.searchText,
            hintStyle: TextStyleConstant.instance.textLargeRegular
                .copyWith(color: ColorConstant.instance.neutral300)),
      ),
    );
  }
}
