class InsideMachineProductModel {
  InsideMachineProductModel({
      this.products,});

  InsideMachineProductModel.fromJson(dynamic json) {
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
      this.slotNum, 
      this.productId, 
      this.price, 
      this.machineId, 
      this.image, 
      this.type, 
      this.org, 
      this.materialabb, 
      this.extent, 
      this.slotStatus, 
      this.machineIdCloud, 
      this.cat, 
      this.machineCode,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    itemName = json['item_name'];
    slotNum = json['slot_num'];
    productId = json['product_id'];
    price = json['price'];
    machineId = json['machine_id'];
    image = json['image'];
    type = json['type'];
    org = json['org'];
    materialabb = json['material abb'];
    extent = json['extent'];
    slotStatus = json['slot_status'];
    machineIdCloud = json['machine_id_cloud'];
    cat = json['cat'];
    machineCode = json['machine_code'];
  }
  String? id;
  String? itemName;
  String? slotNum;
  String? productId;
  String? price;
  String? machineId;
  String? image;
  String? type;
  String? org;
  String? materialabb;
  String? extent;
  String? slotStatus;
  String? machineIdCloud;
  String? cat;
  String? machineCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['item_name'] = itemName;
    map['slot_num'] = slotNum;
    map['product_id'] = productId;
    map['price'] = price;
    map['machine_id'] = machineId;
    map['image'] = image;
    map['type'] = type;
    map['org'] = org;
    map['material abb'] = materialabb;
    map['extent'] = extent;
    map['slot_status'] = slotStatus;
    map['machine_id_cloud'] = machineIdCloud;
    map['cat'] = cat;
    map['machine_code'] = machineCode;
    return map;
  }

}