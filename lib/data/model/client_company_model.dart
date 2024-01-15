class ClientCompanyModel {
  ClientCompanyModel({
      this.clients,});

  ClientCompanyModel.fromJson(dynamic json) {
    if (json['clients'] != null) {
      clients = [];
      json['clients'].forEach((v) {
        clients?.add(Clients.fromJson(v));
      });
    }
  }
  List<Clients>? clients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (clients != null) {
      map['clients'] = clients?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Clients {
  Clients({
      this.id, 
      this.name, 
      this.image, 
      this.description, 
      this.status, 
      this.backimage, 
      this.address, 
      this.companycode,});

  Clients.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    backimage = json['backimage'];
    address = json['address'];
    companycode = json['companycode'];
  }
  String? id;
  String? name;
  String? image;
  String? description;
  String? status;
  String? backimage;
  String? address;
  String? companycode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['status'] = status;
    map['backimage'] = backimage;
    map['address'] = address;
    map['companycode'] = companycode;
    return map;
  }

}