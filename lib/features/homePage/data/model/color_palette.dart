class ColorPalette {
  int? results;
  int? page;
  List<ColorInfo>? data;

  ColorPalette({this.results, this.page, this.data});

  ColorPalette.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    page = json['page'];
    if (json['data'] != null) {
      data = <ColorInfo>[];
      json['data'].forEach((v) {
        data!.add(new ColorInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    data['page'] = this.page;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorInfo {
  final String Id;
  final String name;
  final String color1;
  final String color2;
  final String color3;
  final String color4;
  final String slug;
  final String createdAt;
  final String updatedAt;
  final int V;

  ColorInfo(this.Id, this.name, this.color1, this.color2, this.color3,
      this.color4, this.slug, this.createdAt, this.updatedAt, this.V);

  factory ColorInfo.fromJson(Map<String, dynamic> json) {
    return ColorInfo(
        json['_id'],
        json['name'],
        json['color1'],
        json['color2'],
        json['color3'],
        json['color4'],
        json['slug'],
        json['createdAt'],
        json['updatedAt'],
        json['__v']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.Id;
    data['name'] = this.name;
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    data['color3'] = this.color3;
    data['color4'] = this.color4;

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.V;
    return data;
  }
}

class Category {
  String? name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
