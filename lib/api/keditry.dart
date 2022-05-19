import 'dart:convert';

//json encode
/*
main() {
  var cat1 = {
    "İsim": "Noodle",
    "Yaş": 1,
    "Cinsi": "Tekir",
    "Cinsiyet": "Erkek",
    "Kısır mı?": "Kısır",
  };

  var cat2 = {
    "İsim": "Paşa",
    "Yaş": 17,
    "Cinsi": "İran",
    "Cinsiyet": "Erkek",
    "Kısır mı?": "Değil",
  };

  var json1 = jsonEncode(cat1);
  var json2 = jsonEncode(cat2);
  print(json1);
  print(json2);
} */

//json decode
main() {
  var json1 = '''{
      "İsim": "Noodle",
      "Yaş": 1,
      "Cinsi": "Tekir",
      "Cinsiyet": "Erkek",
      "Kısır mı?": "Kısır",
    }''';
  var map = jsonDecode(json1);
  print(map);
  print(map['İsim']);

  var json2 = '''{
      "İsim": "Paşa",
      "Yaş": 17,
      "Cinsi": "İran",
      "Cinsiyet": "Erkek",
      "Kısır mı?": "Değil",
    }''';
  var mapp = jsonDecode(json2);
  print(map);
  print(map['İsim']);
  
}
