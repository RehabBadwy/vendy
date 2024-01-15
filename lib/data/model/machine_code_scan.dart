class MachineCodeScan {
  MachineCodeScan({
      this.product,});

  MachineCodeScan.fromJson(dynamic json) {
    if (json['product'] != null) {
      product = [];
      json['product'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
  }
  List<Product>? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Product {
  Product({
      this.id, 
      this.itemName, 
      this.price, 
      this.productCode, 
      this.machineCode, 
      this.extent, 
      this.type, 
      this.color, 
      this.slotNumber, 
      this.btItemCode, 
      this.machineId, 
      this.catName, 
      this.mac, 
      this.org, 
      this.machineName, 
      this.machineType, 
      this.orgName, 
      this.system,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    itemName = json['item_name'];
    price = json['price'];
    productCode = json['product_code'];
    machineCode = json['machine_code'];
    extent = json['extent'];
    type = json['type'];
    color = json['color'];
    slotNumber = json['slot_number'];
    btItemCode = json['bt_item_code'];
    machineId = json['machine_id'];
    catName = json['cat_name'];
    mac = json['mac'];
    org = json['org'];
    machineName = json['machine_name'];
    machineType = json['machine_type'];
    orgName = json['org_name'];
    system = json['system'];
  }
  String? id;
  String? itemName;
  String? price;
  String? productCode;
  String? machineCode;
  String? extent;
  String? type;
  String? color;
  String? slotNumber;
  String? btItemCode;
  String? machineId;
  String? catName;
  String? mac;
  String? org;
  String? machineName;
  String? machineType;
  String? orgName;
  String? system;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['item_name'] = itemName;
    map['price'] = price;
    map['product_code'] = productCode;
    map['machine_code'] = machineCode;
    map['extent'] = extent;
    map['type'] = type;
    map['color'] = color;
    map['slot_number'] = slotNumber;
    map['bt_item_code'] = btItemCode;
    map['machine_id'] = machineId;
    map['cat_name'] = catName;
    map['mac'] = mac;
    map['org'] = org;
    map['machine_name'] = machineName;
    map['machine_type'] = machineType;
    map['org_name'] = orgName;
    map['system'] = system;
    return map;
  }

}