class SaveCard {
  SaveCard({
      this.cards,});

  SaveCard.fromJson(dynamic json) {
    if (json['cards'] != null) {
      cards = [];
      json['cards'].forEach((v) {
        cards?.add(Cards.fromJson(v));
      });
    }
  }
  List<Cards>? cards;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cards != null) {
      map['cards'] = cards?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cards {
  Cards({
      this.id, 
      this.name, 
      this.type, 
      this.mask, 
      this.userId,});

  Cards.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    mask = json['mask'];
    userId = json['User_id'];
  }
  String? id;
  String? name;
  String? type;
  String? mask;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['mask'] = mask;
    map['User_id'] = userId;
    return map;
  }

}