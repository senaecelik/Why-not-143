import 'dart:convert';
main() {
  var json1 = '''{
      "İsim": "Fındık",
      "Yaş": 18,
      "Cinsi": "Amerikan Cocker",
      "Cinsiyet": "Dişi",
      "Kısır mı?": "Değil",
    }''';
  var map = jsonDecode(json1);
  print(map);
  print(map['İsim']);

  var json2 = '''{
      "İsim": "Ares",
      "Yaş": 7,
      "Cinsi": "Golden Retriver",
      "Cinsiyet": "Erkek",
      "Kısır mı?": "Değil",
    }''';
  var mapp = jsonDecode(json2);
  print(map);
  print(map['İsim']);
  

}