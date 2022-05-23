class Pet {
  List<Pets>? pets;

  Pet({this.pets});

  Pet.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = <Pets>[];
      json['pets'].forEach((v) {
        pets!.add(Pets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (pets != null) {
      data['pets'] = pets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pets {
  String? name;
  String? type;
  String? cins;
  String? gender;
  String? age;
  String? location;
  String? history;
  String? photo;

  Pets(
      {this.name,
      this.type,
      this.cins,
      this.gender,
      this.age,
      this.location,
      this.history,
      this.photo});

  Pets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    cins = json['cins'];
    gender = json['gender'];
    age = json['age'];
    location = json['location'];
    history = json['history'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['type'] = type;
    data['cins'] = cins;
    data['gender'] = gender;
    data['age'] = age;
    data['location'] = location;
    data['history'] = history;
    data['photo'] = photo;
    return data;
  }
}
