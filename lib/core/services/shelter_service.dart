import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:why_not_143_team/meta/model/shelter_model.dart';

class ShelterApi {
  static const String _url =
      "https://raw.githubusercontent.com/selda-kocak/json-example-sk/master/shelter-data.json";

  static Future<List<Shelters>> getShelterData() async {
    List<Shelters> _list = [];

    Response result = await Dio().get(_url);

    //result.data.runtimeType;

    var petList = jsonDecode(result.data)["shelters"];
    //debugPrint(petList["pets"].toString());

    if (petList is List) {
      _list = petList.map((e) => Shelters.fromJson(e)).toList();
    }
    return _list;
  }
}
