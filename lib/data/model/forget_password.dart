class ForgetPassword {
  ForgetPassword({
      this.id, 
      this.name, 
      this.phone, 
      this.pointBalance, 
      this.walletBalance, 
      this.status, 
      this.password, 
      this.token, 
      this.email, 
      this.otp, 
      this.invitationNum, 
      this.accountType, 
      this.storeName, 
      this.storeImage, 
      this.parent, 
      this.categorie, 
      this.subcategorie, 
      this.date, 
      this.lastname, 
      this.cardToken, 
      this.tt, 
      this.userMac, 
      this.userMac2, 
      this.company, 
      this.platform, 
      this.appversionAndroid, 
      this.appversionIos,});

  ForgetPassword.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    pointBalance = json['point_balance'];
    walletBalance = json['wallet_balance'];
    status = json['status'];
    password = json['password'];
    token = json['token'];
    email = json['email'];
    otp = json['otp'];
    invitationNum = json['invitation_num'];
    accountType = json['account_type'];
    storeName = json['store_name'];
    storeImage = json['store_image'];
    parent = json['parent'];
    categorie = json['categorie'];
    subcategorie = json['subcategorie'];
    date = json['date'];
    lastname = json['lastname'];
    cardToken = json['card_token'];
    tt = json['tt'];
    userMac = json['user_mac'];
    userMac2 = json['user_mac2'];
    company = json['company'];
    platform = json['platform'];
    appversionAndroid = json['Appversion_android'];
    appversionIos = json['Appversion_ios'];
  }
  String? id;
  String? name;
  String? phone;
  String? pointBalance;
  String? walletBalance;
  String? status;
  String? password;
  String? token;
  String? email;
  String? otp;
  String? invitationNum;
  String? accountType;
  String? storeName;
  String? storeImage;
  String? parent;
  String? categorie;
  String? subcategorie;
  String? date;
  String? lastname;
  String? cardToken;
  String? tt;
  String? userMac;
  String? userMac2;
  String? company;
  String? platform;
  String? appversionAndroid;
  String? appversionIos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['point_balance'] = pointBalance;
    map['wallet_balance'] = walletBalance;
    map['status'] = status;
    map['password'] = password;
    map['token'] = token;
    map['email'] = email;
    map['otp'] = otp;
    map['invitation_num'] = invitationNum;
    map['account_type'] = accountType;
    map['store_name'] = storeName;
    map['store_image'] = storeImage;
    map['parent'] = parent;
    map['categorie'] = categorie;
    map['subcategorie'] = subcategorie;
    map['date'] = date;
    map['lastname'] = lastname;
    map['card_token'] = cardToken;
    map['tt'] = tt;
    map['user_mac'] = userMac;
    map['user_mac2'] = userMac2;
    map['company'] = company;
    map['platform'] = platform;
    map['Appversion_android'] = appversionAndroid;
    map['Appversion_ios'] = appversionIos;
    return map;
  }

}