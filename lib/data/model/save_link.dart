class SaveLink {
  SaveLink({
      this.links,});

  SaveLink.fromJson(dynamic json) {
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
  }
  List<Links>? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Links {
  Links({
      this.id, 
      this.link, 
      this.cat, 
      this.subcat, 
      this.priority, 
      this.status, 
      this.userId, 
      this.activate,});

  Links.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    cat = json['cat'];
    subcat = json['subcat'];
    priority = json['priority'];
    status = json['status'];
    userId = json['User_id'];
    activate = json['activate'];
  }
  String? id;
  String? link;
  String? cat;
  String? subcat;
  String? priority;
  String? status;
  String? userId;
  String? activate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['cat'] = cat;
    map['subcat'] = subcat;
    map['priority'] = priority;
    map['status'] = status;
    map['User_id'] = userId;
    map['activate'] = activate;
    return map;
  }

}