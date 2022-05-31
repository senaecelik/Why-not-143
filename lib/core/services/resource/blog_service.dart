import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:why_not_143_team/meta/model/blog_model.dart';

class BlogApi {
  static const String _url =
      "https://raw.githubusercontent.com/senaecelik/json-example-sk/master/blog.json";

  static Future<List<Blogs>> getBlog() async {
    List<Blogs> _list = [];

    Response result = await Dio().get(_url);

    //result.data.runtimeType;

    var petList = jsonDecode(result.data)['blogs'];
    //debugPrint(petList["pets"].toString());

    if (petList is List) {
      _list = petList.map((e) => Blogs.fromJson(e)).toList();
    }
    return _list;
  }
}
