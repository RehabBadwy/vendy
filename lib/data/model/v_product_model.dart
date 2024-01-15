class VProductModel {
  VProductModel({
      this.products,});

  VProductModel.fromJson(dynamic json) {
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
      this.image, 
      this.price,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    itemName = json['item_name'];
    image = json['image'];
    price = json['price'];
  }
  String? id;
  String? itemName;
  String? image;
  String? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['item_name'] = itemName;
    map['image'] = image;
    map['price'] = price;
    return map;
  }

}