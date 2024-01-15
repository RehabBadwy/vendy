class SaveProfileVtouch {
  SaveProfileVtouch({
      this.data,});

  SaveProfileVtouch.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.phone1, 
      this.phone2, 
      this.phone3, 
      this.email, 
      this.website, 
      this.userId, 
      this.address, 
      this.image, 
      this.activate,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    phone3 = json['phone3'];
    email = json['email'];
    website = json['website'];
    userId = json['User_id'];
    address = json['address'];
    image = json['image'];
    activate = json['activate'];
  }
  String? id;
  String? name;
  String? phone1;
  String? phone2;
  String? phone3;
  String? email;
  String? website;
  String? userId;
  String? address;
  String? image;
  String? activate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone1'] = phone1;
    map['phone2'] = phone2;
    map['phone3'] = phone3;
    map['email'] = email;
    map['website'] = website;
    map['User_id'] = userId;
    map['address'] = address;
    map['image'] = image;
    map['activate'] = activate;
    return map;
  }

}