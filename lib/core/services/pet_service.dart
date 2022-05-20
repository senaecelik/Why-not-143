import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:why_not_143_team/meta/model/pet_model.dart';

class PetApi {
  static const String _url =
      "https://raw.githubusercontent.com/selda-kocak/json-example-sk/master/pets-data.json";

  static Future<List<Pets>> getPetData() async {
    List<Pets> _list = [];

    Response result = await Dio().get(_url);

    //result.data.runtimeType;

    var petList = jsonDecode(result.data)['pets'];
    //debugPrint(petList["pets"].toString());

    if (petList is List) {
      _list = petList.map((e) => Pets.fromJson(e)).toList();
    }
    return _list;
  }
}
