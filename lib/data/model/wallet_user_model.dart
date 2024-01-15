class WalletUserModel {
  WalletUserModel({
      this.wallet,});

  WalletUserModel.fromJson(dynamic json) {
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
      this.walletBalance, 
      this.pointBalance,});

  Wallet.fromJson(dynamic json) {
    walletBalance = json['wallet_balance'];
    pointBalance = json['point_balance'];
  }
  String? walletBalance;
  String? pointBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wallet_balance'] = walletBalance;
    map['point_balance'] = pointBalance;
    return map;
  }

}