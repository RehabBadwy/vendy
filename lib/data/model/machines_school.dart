class MachinesSchool {
  MachinesSchool({
      this.machines,});

  MachinesSchool.fromJson(dynamic json) {
    if (json['machines'] != null) {
      machines = [];
      json['machines'].forEach((v) {
        machines?.add(Machines.fromJson(v));
      });
    }
  }
  List<Machines>? machines;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (machines != null) {
      map['machines'] = machines?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Machines {
  Machines({
      this.id, 
      this.machineId, 
      this.machineType, 
      this.machineCloud, 
      this.image, 
      this.location, 
      this.status, 
      this.schoolName, 
      this.schoolId,});

  Machines.fromJson(dynamic json) {
    id = json['id'];
    machineId = json['machine_id'];
    machineType = json['machine_type'];
    machineCloud = json['machine_cloud'];
    image = json['image'];
    location = json['location'];
    status = json['status'];
    schoolName = json['school_name'];
    schoolId = json['school_id'];
  }
  String? id;
  String? machineId;
  String? machineType;
  String? machineCloud;
  String? image;
  String? location;
  String? status;
  String? schoolName;
  String? schoolId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['machine_id'] = machineId;
    map['machine_type'] = machineType;
    map['machine_cloud'] = machineCloud;
    map['image'] = image;
    map['location'] = location;
    map['status'] = status;
    map['school_name'] = schoolName;
    map['school_id'] = schoolId;
    return map;
  }

}