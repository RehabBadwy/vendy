class StudentData {
  StudentData({
      this.studentDataa,});

  StudentData.fromJson(dynamic json) {
    if (json['student_data'] != null) {
      studentDataa = [];
      json['student_data'].forEach((v) {
        studentDataa?.add(StudentDataa.fromJson(v));
      });
    }
  }
  List<StudentDataa>? studentDataa;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (studentDataa != null) {
      map['student_data'] = studentDataa?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class StudentDataa {
  StudentDataa({
      this.id, 
      this.studentId, 
      this.studentName, 
      this.classs, 
      this.schoolName, 
      this.schoolId, 
      this.wallet, 
      this.parent, 
      this.vscode});

  StudentDataa.fromJson(dynamic json) {
    id = json['id'];
    studentId = json['student_id'];
    studentName = json['student_name'];
    classs = json['classs'];
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
    map['classs'] = classs;
    map['school_name'] = schoolName;
    map['school_id'] = schoolId;
    map['wallet'] = wallet;
    map['parent'] = parent;
    map['vscode'] = vscode;
    return map;
  }

}