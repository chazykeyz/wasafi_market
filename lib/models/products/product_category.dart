import 'dart:convert';

ProductCategory productCategoryFromJson(String str) =>
    ProductCategory.fromJson(json.decode(str));

String productCategoryToJson(ProductCategory data) =>
    json.encode(data.toJson());

class ProductCategory {
  ProductCategory({
    required this.page,
    required this.count,
    required this.categories,
  });

  final int page;
  final int count;
  final List<Category> categories;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        page: json["page"],
        count: json["count"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "count": count,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category(
      {required this.id,
      required this.name,
      required this.subCategories,
      required this.v,
      required this.thumbnail});

  final String id;
  final String name;
  final List<SubCategory> subCategories;
  final int v;
  final String thumbnail;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
        v: json["__v"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "subCategories":
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
        "__v": v,
        "thumbnail": thumbnail,
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.v,
  });

  final String id;
  final String name;
  final int v;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
