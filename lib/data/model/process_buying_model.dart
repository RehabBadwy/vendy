class ProcessBuyingModel {
  ProcessBuyingModel({
      this.wallet,});

  ProcessBuyingModel.fromJson(dynamic json) {
    if (json['wallet'] != null) {
      wallet = [];
      json['wallet'].forEach((v) {
        wallet?.add(Wallet.fromJson(v));
      });
    }
  }
  List<Wallet>? wallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (wallet != null) {
      map['wallet'] = wallet?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Wallet {
  Wallet({
      this.id, 
      this.machineId, 
      this.productId, 
      this.price, 
      this.status, 
      this.userId, 
      this.dt,});

  Wallet.fromJson(dynamic json) {
    id = json['id'];
    machineId = json['machine_id'];
    productId = json['product_id'];
    price = json['price'];
    status = json['status'];
    userId = json['user_id'];
    dt = json['dt'];
  }
  String? id;
  String? machineId;
  String? productId;
  String? price;
  String? status;
  String? userId;
  String? dt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['machine_id'] = machineId;
    map['product_id'] = productId;
    map['price'] = price;
    map['status'] = status;
    map['user_id'] = userId;
    map['dt'] = dt;
    return map;
  }

}