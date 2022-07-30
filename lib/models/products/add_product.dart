import 'dart:ui';

class ProductAdd {
  ProductAdd(this.size, this.color, this.discount,
      {required this.name,
      required this.category,
      required this.subCategory,
      required this.thumbnail,
      required this.price,
      required this.stockCount,
      required this.description,
      required this.seller});

  String name;
  String category;
  String subCategory;
  String seller;
  List thumbnail;
  int price;
  int stockCount;
  List<dynamic> size;
  List<Color> color;
  int discount;
  String description;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["category"] = category;
    data["subCategory"] = subCategory;
    data["thumbnail"] = thumbnail;
    data["price"] = price;
    data["seller"] = seller;
    data["stockCount"] = stockCount;
    data["size"] = size;
    data["color"] = color;
    data["discount"] = discount;
    data["description"] = description;
    return data;
  }
}
