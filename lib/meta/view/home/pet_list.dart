import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/core/services/pet_service.dart';
import 'package:why_not_143_team/meta/helper/constant/color_constant.dart';
import 'package:why_not_143_team/meta/helper/constant/text_style.dart';
import 'package:why_not_143_team/meta/model/pet_model.dart';
import 'package:why_not_143_team/meta/view/detail/detail_page.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';

class PetList extends StatefulWidget {
  const PetList({Key? key}) : super(key: key);
  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  late Future<List<Pets>> _petList;
  @override
  void initState() {
    _petList = PetApi.getPetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pets>>(
        future: _petList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Pets> _myList = snapshot.data!;
            return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
              itemCount: _myList.length,
              itemBuilder: (context, index) {
                var pet = _myList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  pet: pet,
                                )));
                  },
                  child: PetListItem(
                      name: pet.name!, cins: pet.cins!, photo: pet.photo!),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("hata çıktı"),
            );
          } else {
            return const Center(
              child: CustomCircular(),
            );
          }
        });
  }
}

class PetListItem extends StatelessWidget {
  final String name;
  final String cins;
  final String photo;
  const PetListItem(
      {required this.name, required this.cins, required this.photo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Card(
            elevation: 7,
            color: ColorConstant.instance.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  width: 150.w,
                  child: CachedNetworkImage(
                    imageUrl: photo,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  name,
                  style: TextStyleConstant.instance.textLargeMedium,
                ),
                Text(cins,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyleConstant.instance.textSmallRegular),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
