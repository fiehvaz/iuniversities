class PostModel {
  final String name;
  final String? state_province;
  final List domains;
  final List web_pages;

  PostModel(this.name, this.state_province, this.domains, this.web_pages);
//
  factory PostModel.fromjson(Map json) {
    return PostModel(
      json['name'],
      json['state-province'],
      json['domains'],
      json['web_pages'],
    );
  }

  @override
  String toString() => 'name: $name';
}
