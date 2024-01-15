class FileModel {
  FileModel({
      this.received,});

  FileModel.fromJson(dynamic json) {
    received = json['Received'];
  }
  String? received;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Received'] = received;
    return map;
  }

}