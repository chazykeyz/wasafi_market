import 'dart:convert';

Shops shopsFromJson(String str) => Shops.fromJson(json.decode(str));

String shopsToJson(Shops data) => json.encode(data.toJson());

class Shops {
  Shops({
    required this.page,
    required this.count,
    required this.shops,
  });

  int page;
  int count;
  List<Shop> shops;

  factory Shops.fromJson(Map<String, dynamic> json) => Shops(
        page: json["page"],
        count: json["count"],
        shops: List<Shop>.from(json["shops"].map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "count": count,
        "shops": List<dynamic>.from(shops.map((x) => x.toJson())),
      };
}

class Shop {
  Shop({
    required this.id,
    required this.user,
    required this.shopLocation,
    required this.followers,
    required this.shopName,
    required this.isVerified,
    required this.profilePicture,
    required this.shopThumbnails,
    required this.shopCategory,
    required this.income,
    required this.rateValue,
    required this.orders,
    required this.products,
    required this.isActive,
    required this.v,
    required this.bio,
    required this.link,
  });

  String id;
  User user;
  String shopLocation;
  List<String> followers;
  String shopName;
  bool isVerified;
  String profilePicture;
  List<dynamic> shopThumbnails;
  ShopCategory shopCategory;
  int income;
  int rateValue;
  List<dynamic> orders;
  List<dynamic> products;
  bool isActive;
  int v;
  String bio;
  String link;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        shopLocation: json["shop_location"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        shopName: json["shop_name"],
        isVerified: json["is_verified"],
        profilePicture: json["profilePicture"],
        shopThumbnails:
            List<dynamic>.from(json["shop_thumbnails"].map((x) => x)),
        shopCategory: ShopCategory.fromJson(json["shop_category"]),
        income: json["income"],
        rateValue: json["rate_value"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        products: List<dynamic>.from(json["products"].map((x) => x)),
        isActive: json["isActive"],
        v: json["__v"],
        bio: json["bio"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "shop_location": shopLocation,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "shop_name": shopName,
        "is_verified": isVerified,
        "profilePicture": profilePicture,
        "shop_thumbnails": List<dynamic>.from(shopThumbnails.map((x) => x)),
        "shop_category": shopCategory.toJson(),
        "income": income,
        "rate_value": rateValue,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x)),
        "isActive": isActive,
        "__v": v,
        "bio": bio,
        "link": link,
      };
}

class ShopCategory {
  ShopCategory({
    required this.id,
    required this.name,
    required this.details,
    required this.v,
    required this.shops,
  });

  String id;
  String name;
  String details;
  int v;
  List<String> shops;

  factory ShopCategory.fromJson(Map<String, dynamic> json) => ShopCategory(
        id: json["_id"],
        name: json["name"],
        details: json["details"],
        v: json["__v"],
        shops: List<String>.from(json["shops"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "details": details,
        "__v": v,
        "shops": List<dynamic>.from(shops.map((x) => x)),
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.mobileNumber,
    required this.password,
    required this.isActive,
    required this.isFullRegistered,
    required this.searches,
    required this.favorite,
    required this.subscriptions,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String username;
  int mobileNumber;
  String password;
  bool isActive;
  bool isFullRegistered;
  List<dynamic> searches;
  List<dynamic> favorite;
  List<dynamic> subscriptions;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        mobileNumber: json["mobile_number"],
        password: json["password"],
        isActive: json["isActive"],
        isFullRegistered: json["is_full_registered"],
        searches: List<dynamic>.from(json["searches"].map((x) => x)),
        favorite: List<dynamic>.from(json["favorite"].map((x) => x)),
        subscriptions: List<dynamic>.from(json["subscriptions"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "mobile_number": mobileNumber,
        "password": password,
        "isActive": isActive,
        "is_full_registered": isFullRegistered,
        "searches": List<dynamic>.from(searches.map((x) => x)),
        "favorite": List<dynamic>.from(favorite.map((x) => x)),
        "subscriptions": List<dynamic>.from(subscriptions.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
