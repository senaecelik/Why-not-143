import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/helper/route/route_constant.dart';
import 'package:why_not_143_team/meta/widget/card_slider/card_item_1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/meta/widget/card_slider/card_item_2.dart';
import 'package:why_not_143_team/meta/widget/card_slider/card_item_3.dart';
import 'package:why_not_143_team/meta/widget/card_slider/card_item_4.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  int _currentIndex = 0;

  List cardList = [
    CardItem(
      text: StringConstant.instance.cardDonate,
      buttonText: StringConstant.instance.donate,
      pageRoute: RouteConstant.donateScreenRoute,
    ),
    CardItem1(
      text: StringConstant.instance.cardBlog,
      buttonText: StringConstant.instance.explore,
      pageRoute: RouteConstant.blogScreenRoute,
    ),
    CardItem2(
        text: StringConstant.instance.cardSocial,
        buttonText: StringConstant.instance.explore),
    CardItem3(
      text: StringConstant.instance.cardForm,
      buttonText: StringConstant.instance.explore,
    ),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cardSlider(),
        _sliderDot(),
      ],
    );
  }

  CarouselSlider _cardSlider() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 200.0.h,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: cardList.map((card) {
          return Builder(builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: card,
              ),
            );
          });
        }).toList(),
      );
  }

  Row _sliderDot() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(cardList, (index, url) {
          return Container(
            width: 10.0.w,
            height: 7.0.h,
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? ColorConstant.instance.orange.withOpacity(0.5)
                    : ColorConstant.instance.neutral300),
          );
        }),
      );
  }
}
