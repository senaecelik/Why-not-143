import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:why_not_143_team/constant.dart/asset_path.dart';
import 'package:why_not_143_team/constant.dart/color_constant.dart';
import 'package:why_not_143_team/constant.dart/padding_constant.dart';
import 'package:why_not_143_team/constant.dart/string.dart';
import 'package:why_not_143_team/constant.dart/text_style.dart';
import 'package:why_not_143_team/screens/detail_page.dart';

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
            child: Padding(
              padding: PaddingConstant.instance.loginPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _search(),
                  SizedBox(
                    height: 30.h,
                  ),
                  _homePageBodySection(),
                  Container(
                    height: 150,
                    color: ColorConstant.instance.cardColor,
                  ),
                  AnimalListItem(
                      name: "amber",
                      age: "5",
                      photoUrl: AssetPath.instance.cat2)
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
          height: 350.h,
          child: homeTabBarView(context),
        ),
      ],
    );
  }

  Widget homeTabBarView(BuildContext context) {
    return const TabBarView(
      children: [
        SizedBox(height: 100, child: List()),
        SizedBox(height: 100, child: List()),
        SizedBox(height: 100, child: List()),
      ],
    );
  }

// ignore: non_constant_identifier_names
  Widget HomeTabBar(BuildContext context) {
    return SizedBox(
        height: 40.h,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 2, right: 2),
          child: TabBar(
            unselectedLabelColor: ColorConstant.instance.yankeBlue,
            indicator: BoxDecoration(
                color: ColorConstant.instance.yankeBlue,
                borderRadius: BorderRadius.circular(50)),
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
          child: Icon(Icons.menu)),
      leadingWidth: 80,
      title: Text(
        StringConstant.instance.homePage,
        style: GoogleFonts.poppins(color: ColorConstant.instance.yankeBlue),
      ),
    );
  }

  Widget _search() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: ColorConstant.instance.neutral,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstant.instance.neutral),
              borderRadius: BorderRadius.circular(20)),
          hintText: StringConstant.instance.searchText,
          hintStyle: TextStyleConstant.instance.textLargeRegular),
    );
  }
}

class AnimalListItem extends StatelessWidget {
  String name;
  String age;
  String photoUrl;

  AnimalListItem(
      {Key? key, required this.name, required this.age, required this.photoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
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
                  image: DecorationImage(image: AssetImage(photoUrl))),
            ),
            Text(
              name,
              style: TextStyleConstant.instance.textSmallMedium,
            ),
            Text(
              age,
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
