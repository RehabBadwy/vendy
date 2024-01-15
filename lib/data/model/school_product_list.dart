class SchoolProductList {
  SchoolProductList({
      this.products,});

  SchoolProductList.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
      this.id, 
      this.itemName, 
      this.itemCode, 
      this.itemCat, 
      this.status, 
      this.image,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    itemName = json['item_name'];
    itemCode = json['item_code'];
    itemCat = json['item_cat'];
    status = json['status'];
    image = json['image'];
  }
  String? id;
  String? itemName;
  String? itemCode;
  String? itemCat;
  String? status;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['item_name'] = itemName;
    map['item_code'] = itemCode;
    map['item_cat'] = itemCat;
    map['status'] = status;
    map['image'] = image;
    return map;
  }

}