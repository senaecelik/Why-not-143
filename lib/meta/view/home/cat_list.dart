import 'package:flutter/material.dart';
import 'package:why_not_143_team/core/services/resource/pet_service.dart';
import 'package:why_not_143_team/meta/helper/constant/string.dart';
import 'package:why_not_143_team/meta/model/pet_model.dart';
import 'package:why_not_143_team/meta/view/detail/detail_page.dart';
import 'package:why_not_143_team/meta/view/home/pet_list_item.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);
  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
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
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _myList.length,
                itemBuilder: (context, index) {
                  var pet = _myList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(pet: pet)));
                    },
                    child: PetListItem(
                      pet: pet,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(StringConstant.instance.errorMess),
            );
          } else {
            return const Center(
              child: CustomCircular(),
            );
          }
        });
  }
}
