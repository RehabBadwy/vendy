class SchoolTransiction {
  SchoolTransiction({
      this.transaction,});

  SchoolTransiction.fromJson(dynamic json) {
    if (json['transaction'] != null) {
      transaction = [];
      json['transaction'].forEach((v) {
        transaction?.add(Transaction.fromJson(v));
      });
    }
  }
  List<Transaction>? transaction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (transaction != null) {
      map['transaction'] = transaction?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Transaction {
  Transaction({
      this.id, 
      this.item, 
      this.price, 
      this.dt, 
      this.studentId, 
      this.parent, 
      this.schoolId,});

  Transaction.fromJson(dynamic json) {
    id = json['id'];
    item = json['item'];
    price = json['price'];
    dt = json['dt'];
    studentId = json['student_id'];
    parent = json['parent'];
    schoolId = json['school_id'];
  }
  String? id;
  String? item;
  String? price;
  String? dt;
  String? studentId;
  String? parent;
  String? schoolId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['item'] = item;
    map['price'] = price;
    map['dt'] = dt;
    map['student_id'] = studentId;
    map['parent'] = parent;
    map['school_id'] = schoolId;
    return map;
  }

}