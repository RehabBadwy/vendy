class MachinesListModel {
  MachinesListModel({
      this.machines,});

  MachinesListModel.fromJson(dynamic json) {
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
      this.machineName, 
      this.machineId, 
      this.machineType, 
      this.machineCode, 
      this.image, 
      this.machineDes, 
      this.orgName, 
      this.appear, 
      this.status,});

  Machines.fromJson(dynamic json) {
    id = json['id'];
    machineName = json['machine_name'];
    machineId = json['machine_id'];
    machineType = json['machine_type'];
    machineCode = json['machine_code'];
    image = json['image'];
    machineDes = json['machine_des'];
    orgName = json['org_name'];
    appear = json['appear'];
    status = json['status'];
  }
  String? id;
  String? machineName;
  String? machineId;
  String? machineType;
  String? machineCode;
  String? image;
  String? machineDes;
  String? orgName;
  String? appear;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['machine_name'] = machineName;
    map['machine_id'] = machineId;
    map['machine_type'] = machineType;
    map['machine_code'] = machineCode;
    map['image'] = image;
    map['machine_des'] = machineDes;
    map['org_name'] = orgName;
    map['appear'] = appear;
    map['status'] = status;
    return map;
  }

}