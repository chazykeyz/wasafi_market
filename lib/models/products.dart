// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.totalPages,
    required this.data,
  });

  int totalPages;
  List<MainProduct> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        totalPages: json["totalPages"],
        data: List<MainProduct>.from(
            json["data"].map((x) => MainProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MainProduct {
  MainProduct({
    required this.id,
    required this.name,
    required this.discount,
    required this.thumbnails,
    required this.itemcount,
    required this.shop,
    required this.category,
    required this.color,
    required this.size,
    required this.price,
    required this.comments,
    required this.productKind,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  int discount;
  List<String> thumbnails;
  int itemcount;
  Shop shop;
  Category category;
  List<dynamic> color;
  List<dynamic> size;
  int price;
  List<dynamic> comments;
  String productKind;
  List<dynamic> likes;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory MainProduct.fromJson(Map<String, dynamic> json) => MainProduct(
        id: json["_id"],
        name: json["name"],
        discount: json["discount"],
        thumbnails: List<String>.from(json["thumbnails"].map((x) => x)),
        itemcount: json["itemcount"],
        shop: Shop.fromJson(json["shop"]),
        category: Category.fromJson(json["category"]),
        color: List<dynamic>.from(json["color"].map((x) => x)),
        size: List<dynamic>.from(json["size"].map((x) => x)),
        price: json["price"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        productKind: json["product_kind"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "discount": discount,
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x)),
        "itemcount": itemcount,
        "shop": shop.toJson(),
        "category": category.toJson(),
        "color": List<dynamic>.from(color.map((x) => x)),
        "size": List<dynamic>.from(size.map((x) => x)),
        "price": price,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "product_kind": productKind,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.v,
  });

  String id;
  String name;
  String thumbnail;
  int v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "thumbnail": thumbnail,
        "__v": v,
      };
}

class Shop {
  Shop({
    required this.location,
    required this.id,
    required this.name,
    required this.shopCategory,
    required this.owner,
    required this.thumbnails,
    required this.monthlyPlan,
    required this.description,
    required this.subscribers,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Location location;
  String id;
  String name;
  String shopCategory;
  String owner;
  List<String> thumbnails;
  String monthlyPlan;
  String description;
  List<dynamic> subscribers;
  List<dynamic> comments;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        shopCategory: json["shop_category"],
        owner: json["owner"],
        thumbnails: List<String>.from(json["thumbnails"].map((x) => x)),
        monthlyPlan: json["monthly_plan"],
        description: json["description"],
        subscribers: List<dynamic>.from(json["subscribers"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "name": name,
        "shop_category": shopCategory,
        "owner": owner,
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x)),
        "monthly_plan": monthlyPlan,
        "description": description,
        "subscribers": List<dynamic>.from(subscribers.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Location {
  Location({
    required this.lng,
    required this.lat,
  });

  int lng;
  int lat;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lng: json["lng"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "lng": lng,
        "lat": lat,
      };
}
