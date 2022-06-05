import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:why_not_143_team/meta/helper/constant/button_style.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/empty_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/widget/card_slider/carousel_slider_widget.dart';
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
  Future<bool> showExitPopup() async {
    return await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: Text(StringConstant.instance.logOut,
                style: TextStyleConstant.instance.textLargeMedium
                    .copyWith(color: ColorConstant.instance.yankeBlue)),
            content: Text(
              StringConstant.instance.alertDialogText,
              style: TextStyleConstant.instance.textSmallRegular,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text(StringConstant.instance.alertDialogTextNo),
                  style: ButtonStyleConstant.instance.whiteButtonStyle),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                style: ButtonStyleConstant.instance.whiteButtonStyle,
                //return true when click on "Yes"
                child: Text(StringConstant.instance.alertDialogTextYes),
              ),
            ],
          ),
        ) ??
        false;
  }

  late BannerAd _ad;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _ad = BannerAd(
        size: AdSize.banner,
        //Reklam verildiğinde: AdHelper.bannerAdUnitId
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(onAdLoaded: (_ad) {
          setState(() {
            isLoaded = true;
          });
          //print("Banner Ad loaded");
        }, onAdFailedToLoad: (_ad, error) {
          _ad.dispose();
          //print("Ad Failed to Load with Error= $error");
        }),
        request: const AdRequest());
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          appBar: appBar(),
          body: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyBox.instance.emptyBoxNormal,
                  const CardSlider(),
                  EmptyBox.instance.emptyBoxSmall,
                  checkForAd(),
                  _homePageBodySection(),
                ],
              ),
            ),
          )),
    );
  }

  Widget checkForAd() {
    if (isLoaded == true) {
      return Container(
        child: AdWidget(
          ad: _ad,
        ),
        height: _ad.size.height.toDouble(),
        width: _ad.size.width.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _homePageBodySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _homeTabBar(context),
        SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: _homeTabBarView(context)),
      ],
    );
  }

  Widget _homeTabBarView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.r, bottom: 220.r),
      child: TabBarView(
        children: [
          Padding(
            padding: PaddingConstant.instance.tabbarPadding2,
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: PaddingConstant.instance.tabbarPadding2,
                  child: const PetList(),
                )),
          ),
          Padding(
            padding: PaddingConstant.instance.tabbarPadding2,
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: PaddingConstant.instance.tabbarPadding2,
                  child: const CatList(),
                )),
          ),
          Padding(
            padding: PaddingConstant.instance.tabbarPadding2,
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: PaddingConstant.instance.tabbarPadding2,
                  child: const DogList(),
                )),
          ),
        ],
      ),
    );
  }

  Widget _homeTabBar(BuildContext context) {
    return SizedBox(
        height: 50.h,
        width: 280.w,
        child: Padding(
          padding: PaddingConstant.instance.tabbarPadding3,
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
