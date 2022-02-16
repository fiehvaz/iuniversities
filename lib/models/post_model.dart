class PostModel {
  int? id;

  List<String>? webPages;
  String? country;
  String? name;
  String? stateProvince;
  String? webPagesF;
  int? fav;

  PostModel(
      {this.id,
      this.webPages,
      this.country,
      this.name,
      this.stateProvince,
      this.webPagesF,
      this.fav});
//
  PostModel.fromJson(Map json) {
    id = json['id'];
    webPages = json['web_pages'].cast<String>();
    country = json['country'];
    name = json['name'];
    stateProvince = json['state-province'];
    webPagesF = json['webPagesF'];
    fav = json['fav'];
  }

  PostModel.fromBson(Map json) {
    id = json['id'];
    webPagesF = json['webPagesF'];
    country = json['country'];
    name = json['name'];
    stateProvince = json['stateprovince'];
    fav = json['fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['web_pages'] = this.webPages;
    data['country'] = this.country;
    data['name'] = this.name;
    data['state-province'] = this.stateProvince;
    data['web_pagesF'] = this.webPagesF;
    data['fav'] = this.fav;
    return data;
  }
}
