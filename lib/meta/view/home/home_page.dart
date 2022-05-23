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
            padding: EdgeInsets.all(20),
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

  Container _donateCard(BuildContext context) {
    return Container(
      height: 160.h,
      width: 330.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstant.instance.azureishWhite,
            offset: const Offset(
              6.0,
              6.0,
            ),
            blurRadius: 8.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        color: ColorConstant.instance.cardColor,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            ColorConstant.instance.cardColor,
            Colors.orangeAccent,
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                      height: 100.h,
                      child: Image.asset(AssetPath.instance.cat1)),
                ),
                Expanded(
                  child: SizedBox(
                      height: 100.h,
                      child: Lottie.asset(AssetPath.instance.cardImage)),
                ),
                Expanded(
                  child: SizedBox(
                      height: 100.h,
                      child: Image.asset(AssetPath.instance.cat2)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        padding: PaddingConstant.instance.buttonPadding,
                        elevation: 0,
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteConstant.donateScreenRoute);
                      },
                      icon: const Icon(Icons.pets),
                      label: Text(
                        "Bağış Yap",
                        style: TextStyleConstant.instance.textSmallMedium,
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _homePageBodySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HomeTabBar(context),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              child: homeTabBarView(context)),
        ),
      ],
    );
  }

  Widget homeTabBarView(BuildContext context) {
    return TabBarView(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height, child: const PetList()),
        const SizedBox(height: 100, child: List()),
        const SizedBox(height: 100, child: List()),
      ],
    );
  }

// ignore: non_constant_identifier_names
  Widget HomeTabBar(BuildContext context) {
    return Container(
        height: 80.h,
        width: 210.w,
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
                  image: DecorationImage(image: AssetImage(photoUrl!))),
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
