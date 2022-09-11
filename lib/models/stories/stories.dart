// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

List<StoriesModel> storiesModelFromJson(String str) => List<StoriesModel>.from(
    json.decode(str).map((x) => StoriesModel.fromJson(x)));

String storiesModelToJson(List<StoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoriesModel {
  StoriesModel({
    required this.id,
    required this.user,
    required this.storyInstance,
    required this.v,
  });

  String id;
  User user;
  List<StoryInstance> storyInstance;
  int v;

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        storyInstance: List<StoryInstance>.from(
            json["storyInstance"].map((x) => StoryInstance.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "storyInstance":
            List<dynamic>.from(storyInstance.map((x) => x.toJson())),
        "__v": v,
      };
}

class StoryInstance {
  StoryInstance({
    required this.isFitted,
    required this.isShown,
    required this.viewer,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.media,
    required this.text,
    required this.caption,
    required this.productUrl,
  });

  bool isFitted;
  bool isShown;
  int viewer;
  String id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String media;
  String text;
  String caption;
  String productUrl;

  factory StoryInstance.fromJson(Map<String, dynamic> json) => StoryInstance(
        isFitted: json["isFitted"],
        isShown: json["isShown"],
        viewer: json["viewer"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        media: json["media"] == null ? null : json["media"],
        text: json["text"] == null ? null : json["text"],
        caption: json["caption"] == null ? null : json["caption"],
        productUrl: json["productUrl"] == null ? null : json["productUrl"],
      );

  Map<String, dynamic> toJson() => {
        "isFitted": isFitted,
        "isShown": isShown,
        "viewer": viewer,
        "_id": id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "media": media == null ? null : media,
        "text": text == null ? null : text,
        "caption": caption == null ? null : caption,
        "productUrl": productUrl == null ? null : productUrl,
      };
}

class User {
  User({
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
  String user;
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
  String bio;
  String link;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        user: json["user"],
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
        bio: json["bio"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
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
        "bio": bio,
        "link": link,
      };
}
