class PreviewMyFamily {
  PreviewMyFamily({
      this.myfamily,});

  PreviewMyFamily.fromJson(dynamic json) {
    if (json['myfamily'] != null) {
      myfamily = [];
      json['myfamily'].forEach((v) {
        myfamily?.add(Myfamily.fromJson(v));
      });
    }
  }
  List<Myfamily>? myfamily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (myfamily != null) {
      map['myfamily'] = myfamily?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Myfamily {
  Myfamily({
      this.id, 
      this.studentId, 
      this.studentName, 
      this.classs,
      this.schoolName, 
      this.schoolId, 
      this.wallet, 
      this.parent, 
      this.vscode,});

  Myfamily.fromJson(dynamic json) {
    id = json['id'];
    studentId = json['student_id'];
    studentName = json['student_name'];
    classs = json['class'];
    schoolName = json['school_name'];
    schoolId = json['school_id'];
    wallet = json['wallet'];
    parent = json['parent'];
    vscode = json['vscode'];
  }
  String? id;
  String? studentId;
  String? studentName;
  String? classs;
  String? schoolName;
  String? schoolId;
  String? wallet;
  String? parent;
  String? vscode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['student_id'] = studentId;
    map['student_name'] = studentName;
    map['class'] = classs;
    map['school_name'] = schoolName;
    map['school_id'] = schoolId;
    map['wallet'] = wallet;
    map['parent'] = parent;
    map['vscode'] = vscode;
    return map;
  }

}