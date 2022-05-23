import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/core/services/pet_service.dart';
import 'package:why_not_143_team/meta/helper/constant/asset_path.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:lottie/lottie.dart';
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
    PetApi.getPetData();
    return Scaffold(
        appBar: appBar(),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Bir pati dostu ara",
                    style: TextStyleConstant.instance.title1
                        .copyWith(color: ColorConstant.instance.yankeBlue),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _search(),
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
              height: MediaQuery.of(context).size.height,
              child: const PetList()),
          const SizedBox(height: 100, child: List()),
          const SizedBox(height: 100, child: List()),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  Widget HomeTabBar(BuildContext context) {
    return Container(
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

  Widget _search() {
    return Container(
      height: 40.h,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15),
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

class AnimalListItem extends StatelessWidget {
  final String? name;
  final String? age;
  final String? photoUrl;

  const AnimalListItem(
      {Key? key, required this.name, required this.age, required this.photoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 250.h,
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.instance.neutral300.withOpacity(0.9),
                    spreadRadius: 5,
                    blurRadius: 9,
                    offset: const Offset(5, 3), // changes position of shadow
                  ),
                ],
                color: ColorConstant.instance.white,
                image: DecorationImage(
                  image: AssetImage(photoUrl!),
                ),
              ),
            ),
            Text(
              name!,
              style: TextStyleConstant.instance.textSmallMedium,
            ),
            Text(
              age!,
              style: TextStyleConstant.instance.textSmallRegular,
            ),
          ],
        ),
      ),
    );
  }
}

//Fake List
class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
          AnimalListItem(
            age: "5",
            name: "Amber",
            photoUrl: AssetPath.instance.cat1,
          ),
        ],
      ),
    );
  }
}
