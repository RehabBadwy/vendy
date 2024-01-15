class StudentRequest {
  StudentRequest({
      this.status,});

  StudentRequest.fromJson(dynamic json) {
    status = json['status'];
  }
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }

}