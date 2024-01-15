class SliderModel {
  SliderModel({
      this.homeSlider,});

  SliderModel.fromJson(dynamic json) {
    if (json['home_slider'] != null) {
      homeSlider = [];
      json['home_slider'].forEach((v) {
        homeSlider?.add(HomeSlider.fromJson(v));
      });
    }
  }
  List<HomeSlider>? homeSlider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (homeSlider != null) {
      map['home_slider'] = homeSlider?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class HomeSlider {
  HomeSlider({
      this.id, 
      this.title, 
      this.image, 
      this.link, 
      this.cat, 
      this.status,});

  HomeSlider.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    link = json['link'];
    cat = json['cat'];
    status = json['status'];
  }
  String? id;
  String? title;
  String? image;
  String? link;
  String? cat;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['link'] = link;
    map['cat'] = cat;
    map['status'] = status;
    return map;
  }

}