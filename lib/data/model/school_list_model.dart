class SchoolListModel {
  SchoolListModel({
      this.schools,});

  SchoolListModel.fromJson(dynamic json) {
    if (json['schools'] != null) {
      schools = [];
      json['schools'].forEach((v) {
        schools?.add(Schools.fromJson(v));
      });
    }
  }
  List<Schools>? schools;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (schools != null) {
      map['schools'] = schools?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Schools {
  Schools({
      this.id, 
      this.schoolName, 
      this.logo, 
      this.schoolId, 
      this.schoolAddress, 
      this.about, 
      this.status,});

  Schools.fromJson(dynamic json) {
    id = json['id'];
    schoolName = json['school_name'];
    logo = json['logo'];
    schoolId = json['school_id'];
    schoolAddress = json['school_address'];
    about = json['about'];
    status = json['status'];
  }
  String? id;
  String? schoolName;
  String? logo;
  String? schoolId;
  String? schoolAddress;
  String? about;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['school_name'] = schoolName;
    map['logo'] = logo;
    map['school_id'] = schoolId;
    map['school_address'] = schoolAddress;
    map['about'] = about;
    map['status'] = status;
    return map;
  }

}