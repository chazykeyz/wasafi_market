import 'dart:convert';

ShopCategories shopCategoriesFromJson(String str) =>
    ShopCategories.fromJson(json.decode(str));

String shopCategoriesToJson(ShopCategories data) => json.encode(data.toJson());

class ShopCategories {
  ShopCategories({
    required this.page,
    required this.count,
    required this.categories,
  });

  int page;
  int count;
  List<Category> categories;

  factory ShopCategories.fromJson(Map<String, dynamic> json) => ShopCategories(
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
  Category({
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
  List<Shop> shops;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        details: json["details"],
        v: json["__v"],
        shops: List<Shop>.from(json["shops"].map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "details": details,
        "__v": v,
        "shops": List<dynamic>.from(shops.map((x) => x.toJson())),
      };
}

class Shop {
  Shop({
    required this.bio,
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
  });

  String bio;
  String id;
  User user;
  String shopLocation;
  List<String> followers;
  String shopName;
  bool isVerified;
  String profilePicture;
  List<dynamic> shopThumbnails;
  String shopCategory;
  int income;
  int rateValue;
  List<dynamic> orders;
  List<dynamic> products;
  bool isActive;
  int v;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        bio: json["bio"],
        id: json["_id"],
        user: User.fromJson(json["user"]),
        shopLocation: json["shop_location"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        shopName: json["shop_name"],
        isVerified: json["is_verified"],
        profilePicture: json["profilePicture"],
        shopThumbnails:
            List<dynamic>.from(json["shop_thumbnails"].map((x) => x)),
        shopCategory: json["shop_category"],
        income: json["income"],
        rateValue: json["rate_value"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        products: List<dynamic>.from(json["products"].map((x) => x)),
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "bio": bio,
        "_id": id,
        "user": user.toJson(),
        "shop_location": shopLocation,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "shop_name": shopName,
        "is_verified": isVerified,
        "profilePicture": profilePicture,
        "shop_thumbnails": List<dynamic>.from(shopThumbnails.map((x) => x)),
        "shop_category": shopCategory,
        "income": income,
        "rate_value": rateValue,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x)),
        "isActive": isActive,
        "__v": v,
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
