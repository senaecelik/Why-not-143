import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/core/services/pet_service.dart';
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
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 3 / 5.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
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
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              height: 250.h,
              width: 150.w,
              child: CachedNetworkImage(
                imageUrl: photo,
                fit: BoxFit.fill,
              )),
          Text(
            name,
            style: TextStyleConstant.instance.textSmallMedium,
          ),
          Text(
            cins,
            style: TextStyleConstant.instance.textSmallRegular,
          ),
        ],
      ),
    );
  }
}
