class Shelter {
  List<Shelters>? shelters;

  Shelter({this.shelters});

  Shelter.fromJson(Map<String, dynamic> json) {
    if (json['shelters'] != null) {
      shelters = <Shelters>[];
      json['shelters'].forEach((v) {
        shelters!.add( Shelters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (shelters != null) {
      data['shelters'] = shelters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shelters {
  String? name;
  String? type;
  String? city;
  String? location;
  String? iBAN;
  String? history;
  String? photo;

  Shelters(
      {this.name,
      this.type,
      this.city,
      this.location,
      this.iBAN,
      this.history,
      this.photo});

  Shelters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    city = json['city'];
    location = json['location'];
    iBAN = json['IBAN'];
    history = json['history'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['city'] = city;
    data['location'] = location;
    data['IBAN'] = iBAN;
    data['history'] = history;
    data['photo'] = photo;
    return data;
  }
}