class MachineCategory {
  MachineCategory({
      this.cat,});

  MachineCategory.fromJson(dynamic json) {
    if (json['cat'] != null) {
      cat = [];
      json['cat'].forEach((v) {
        cat?.add(Cat.fromJson(v));
      });
    }
  }
  List<Cat>? cat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cat != null) {
      map['cat'] = cat?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cat {
  Cat({
      this.id, 
      this.catName, 
      this.machineCode, 
      this.status,});

  Cat.fromJson(dynamic json) {
    id = json['id'];
    catName = json['cat_name'];
    machineCode = json['machine_code'];
    status = json['status'];
  }
  String? id;
  String? catName;
  String? machineCode;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['cat_name'] = catName;
    map['machine_code'] = machineCode;
    map['status'] = status;
    return map;
  }

}