class NotificationModel {
  NotificationModel({
      this.notifications,});

  NotificationModel.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  List<Notifications>? notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Notifications {
  Notifications({
      this.id, 
      this.title, 
      this.subtitle, 
      this.phone, 
      this.status,});

  Notifications.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    phone = json['phone'];
    status = json['status'];
  }
  String? id;
  String? title;
  String? subtitle;
  String? phone;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['phone'] = phone;
    map['status'] = status;
    return map;
  }

}