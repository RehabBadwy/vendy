class MachineOrderModel {
  MachineOrderModel({
      this.status,});

  MachineOrderModel.fromJson(dynamic json) {
    status = json['Status'];
  }
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    return map;
  }

}