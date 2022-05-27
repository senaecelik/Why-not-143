import 'package:flutter/material.dart';
import 'package:why_not_143_team/core/services/pet_service.dart';
import 'package:why_not_143_team/meta/model/pet_model.dart';
import 'package:why_not_143_team/meta/view/detail/detail_page.dart';
import 'package:why_not_143_team/meta/view/home/pet_list_item.dart';
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
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              /*gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 0,
                mainAxisExtent: 300,
                childAspectRatio: 10,
              ),*/
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
