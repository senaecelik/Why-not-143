import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:why_not_143_team/core/services/resource/shelter_service.dart';
import 'package:why_not_143_team/meta/helper/constant/padding_constant.dart';
import 'package:why_not_143_team/meta/model/shelter_model.dart';
import 'package:why_not_143_team/meta/view/donate/shelter_list_item.dart';
import 'package:why_not_143_team/meta/view/donate/shelter_page.dart';
import 'package:why_not_143_team/meta/widget/custom_circular.dart';

class ShelterList extends StatefulWidget {
  const ShelterList({Key? key}) : super(key: key);
  @override
  State<ShelterList> createState() => _ShelterListState();
}

class _ShelterListState extends State<ShelterList> {
  late Future<List<Shelters>> _petList;
  @override
  void initState() {
    _petList = ShelterApi.getShelterData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstant.instance.genelPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          FutureBuilder<List<Shelters>>(
              future: _petList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Shelters> _myList = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _myList.length,
                    itemBuilder: (context, index) {
                      var shelter = _myList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShelterPage(shelters: shelter)));
                        },
                        child: Column(
                          children: [
                            ShelterListItem(
                              name: shelter.name!,
                              city: shelter.city!,
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Hata çıktı"),
                  );
                } else {
                  return const Center(
                    child: CustomCircular(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
