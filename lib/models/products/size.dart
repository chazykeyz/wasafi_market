class Sizes {
  String? id;
  String? size;
  int? v;

  Sizes({this.id, this.size, this.v});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    size = json['size'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['size'] = size;
    data['__v'] = v;
    return data;
  }
}
